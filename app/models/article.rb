class Article < ApplicationRecord
  belongs_to :user
  default_scope->{order(created_at: :desc)}
  has_many :tags ,through: :article_tags
  validates:content,presence:true,length:{maximum:1000}
  validates:memo,length:{maximum:1000}
  validates:sleep_n,numericality:{only_integer:true,greater_than_or_equal_to:0}
  validates:user_id,presence:true
end