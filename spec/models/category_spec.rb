require 'rails_helper'
RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      category = Category.new(name: 'Food', icon: 'food-icon', user: User.new)
      expect(category).to be_valid
    end

    it 'is not valid without a name' do
      category = Category.new(icon: 'food-icon', user: User.new)
      expect(category).not_to be_valid
    end

    it 'is not valid without an icon' do
      category = Category.new(name: 'Food', user: User.new)
      expect(category).not_to be_valid
    end

    it 'is not valid with a short name' do
      category = Category.new(name: 'F', icon: 'food-icon', user: User.new)
      expect(category).not_to be_valid
    end

    it 'is not valid with a long name' do
      category = Category.new(name: 'A' * 51, icon: 'food-icon', user: User.new)
      expect(category).not_to be_valid
    end
  end
end
