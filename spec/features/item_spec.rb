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


    #   it 'displays the navigation bar for item creation' do
    #     expect(page).to have_css('.navbar', text: 'New Item')
    #     expect(page).to have_css('.bi-arrow-left-short')
    #     expect(page).to have_css('.bi-search')
    #   end

    #   it 'allows user to create a new item' do
    #     fill_in 'Name', with: @item.name
    #     fill_in 'Amount', with: @item.amount
    #     select @category.name, from: 'Category'
    #     click_button 'Save'

    #     expect(page).to have_content('Item was successfully created.')
    #     expect(page).to have_content(@item.name)
    #     expect(page).to have_content("$ #{@item.amount}")
    #   end

    #   it 'displays the navigation bar for item view' do
    #     @item.save
    #     visit item_path(@item)

    #     expect(page).to have_css('.navbar', text: @item.name)
    #     expect(page).to have_css('.bi-arrow-left-short')
    #     expect(page).to have_css('.bi-search')
    #   end

    #   it 'displays the content of the created item' do
    #     @item.save
    #     visit item_path(@item)

    #     expect(page).to have_content(@item.name)
    #     expect(page).to have_content("$ #{@item.amount}")
    #   end
  end
end
