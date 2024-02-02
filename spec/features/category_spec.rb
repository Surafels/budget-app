require 'rails_helper'

RSpec.describe 'Categories view', type: :feature do
  before(:each) do
    @user = User.create(name: 'New', email: 'new@gmail.com', password: '123123')
    @categories = [
      Category.create(name: 'Books', icon: 'bi bi-book', user: @user),
      Category.create(name: 'Electronics', icon: 'bi bi-lightning', user: @user)
    ]
    @total_amount = @categories.sum { |category| category.items.sum(&:amount) }
    @category_totals = @categories.each_with_object({}) do |category, hash|
      hash[category.name] = category.items.sum(&:amount)
    end

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit categories_path
  end

  it 'displays the "Add New Category" button' do
    visit categories_path
    expect(page).to have_link('Add New Category', href: new_category_path)
  end

  it 'displays the user email and sign out button if user is signed in' do
    expect(page).to have_content("Hi, #{@user.email}")
    expect(page).to have_button('Sign Out')
  end

  describe 'category validation' do
    it 'should have an Add New Category button' do
      visit categories_path
      expect(page).to have_content('Add New Category')
    end

    it 'should have a Total of all categories part' do
      visit categories_path
      expect(page).to have_content('Total of all categories:')
    end

    it 'should have categories' do
      visit categories_path
      expect(page).to have_content('Categories')
    end
  end
end
