class Article < ApplicationRecord
  belongs_to :user
  validates:content,precedence:true,length:{maximum:1000}
  validates:memo,length:{maximum:1000}
  validates:sleep_n,numericality:{only_integer:true,greater_than_or_equal_to:0}
end
