class User < ApplicationRecord
    has_secure_password
    has_many :articles
    validates:name,presence:true,uniqueness:true,length:{minimum:4,maximum:50}
    validates:email,presence:true,uniqueness:true,length:{maximum:255}
    validates:password,presence:true,length:{minimum:5,maximum:50}

end
