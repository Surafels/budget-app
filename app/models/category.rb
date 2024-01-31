class Category < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :icon, presence: true
end
