class Tag < ApplicationRecord
  belongs_to :user
  has_many :articles ,through: :article_tags
  validates:name,presence:true,length:{maximum:255}
  validates:type,presence:true,numericality:{in:0..1}

end
