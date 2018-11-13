class User < ApplicationRecord
    has_many :posts

    validates :name,{presence: true}
    validates :mail,{presence: true}
    validates :pass,{presence: true}
end
