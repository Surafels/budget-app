require 'rails_helper'

RSpec.describe 'Item creation and view', type: :feature do
  before(:each) do
    @user = User.create(name: 'New', email: 'test@gmail.com', password: '123456')
    @category = Category.create(name: 'Books', icon: 'bi bi-book', user_id: @user.id)
    @item = Item.new(name: 'Item one', amount: 40, category_id: @category.id, author_id: @user.id)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit new_item_path
  end

  describe 'Items and menu validation' do
    it 'should have Sign out button in menu' do
      visit categories_path
      expect(page).to have_content('Sign Out')
    end

    it 'should have add button' do
      visit categories_path
      expect(page).to have_content('Add New Category')
    end

    it 'shoue have Total part' do
      visit categories_path
      expect(page).to have_content('Total of all categories:')
    end
  end
end
