class User < ApplicationRecord
    has_many :categories, foreign_key: "author_id"
    has_many :items

    validates :name, presence :true, length: { minimum: 2, maximum: 50 }
    
end
