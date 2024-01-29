class User < ApplicationRecord
    has_many :categories, foreign_key: "author_id"

end
