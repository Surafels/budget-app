class Category < ApplicationRecord
    belongs_to :user, foreign_key: "author_id"
    has_many :items
end
