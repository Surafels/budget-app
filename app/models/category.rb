class Category < ApplicationRecord
    belongs_to :user, foreign_key: "author_id"
    has_many :items

    validates :name, presence :true length: { minimum: 2, maximum: 50 }
    validates :icon, precence :true
end
