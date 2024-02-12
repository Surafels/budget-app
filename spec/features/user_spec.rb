require 'rails_helper'

RSpec.describe 'User management', type: :feature do
  describe 'Home page' do
    it 'displays the welcome message and links to login and signup' do
      visit root_path

      expect(page).to have_content('Budget App')
      expect(page).to have_link('LOG IN', href: new_user_session_path)
      expect(page).to have_link('SIGN UP', href: new_user_registration_path)
    end
  end
end
