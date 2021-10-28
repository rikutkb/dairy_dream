class Article < ApplicationRecord
  belongs_to :user
  default_scope->{order(created_at: :DESC)}
  has_many :article_tags
  has_many :tags ,through: :article_tags, dependent: :destroy
  validates:content,presence:true,length:{maximum:1000}
  validates:memo,length:{maximum:1000}
  validates:sleep_n,numericality:{only_integer:true,greater_than_or_equal_to:0}
  def update_tags(tag_list,kind,user)
    self.delete_tags(kind)
    self.save_tags(tag_list,kind,user)
  end
  def delete_tags(kind)
    self.tags.each do |tag|
      if tag.kind == kind
        tag.decrement!(:citations,1)
        self.tags.delete(tag)
      end
    end
  end
  def save_tags(tag_list,kind,user)#todo refactor
    tag_list.each do |tag|
      if tag.present?
        inspected_tag = user.tags.find_or_create_by(name:tag,kind:kind)
        if !inspected_tag.nil?
          inspected_tag.increment!(:citations,1)
          self.tags.push(inspected_tag)
        end
      else
      end
    end
  end
end