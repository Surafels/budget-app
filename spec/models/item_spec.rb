require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      item = Item.new(name: 'Item 1', amount: 100, category: Category.new, author: User.new)
      expect(item).to be_valid
    end

    it 'is not valid without a name' do
      item = Item.new(amount: 100, category: Category.new, author: User.new)
      expect(item).not_to be_valid
    end

    it 'is not valid without an amount' do
      item = Item.new(name: 'Item 1', category: Category.new, author: User.new)
      expect(item).not_to be_valid
    end

    it 'is not valid with a negative amount' do
      item = Item.new(name: 'Item 1', amount: -10, category: Category.new, author: User.new)
      expect(item).not_to be_valid
    end

    it 'is not valid with a short name' do
      item = Item.new(name: 'I', amount: 100, category: Category.new, author: User.new)
      expect(item).not_to be_valid
    end

    it 'is not valid with a long name' do
      item = Item.new(name: 'A' * 51, amount: 100, category: Category.new, author: User.new)
      expect(item).not_to be_valid
    end
  end
end
