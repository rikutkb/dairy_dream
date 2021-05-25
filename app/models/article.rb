class Article < ApplicationRecord
  belongs_to :user
  default_scope->{order(created_at: :DESC)}
  has_many :article_tags
  has_many :tags ,through: :article_tags
  validates:content,presence:true,length:{maximum:1000}
  validates:memo,length:{maximum:1000}
  validates:sleep_n,numericality:{only_integer:true,greater_than_or_equal_to:0}
  def tags_save(tag_list)
    tag_list.each do |tag|
      if !tag.nil?
        inspected_tag = Tag.find_by(id:tag)
        if !inspected_tag.nil?
          inspected_tag.increment!(:citations,1)
          self.tags.push(inspected_tag)
        end
      else
      end
    end
  end
end