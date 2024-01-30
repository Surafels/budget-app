class Item < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :amount, precence :true
  validates :name, precence :true length: { minimum: 2, maximum: 50 }

end
