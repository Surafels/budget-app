require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'Tom Daniel', email: 'test@gmail.com', password: '123456')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(email: 'test@gmail.com', password: '123456')
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'Tom Daniel', password: '123456')
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user = User.new(name: 'Tom Daniel', email: 'test@gmail.com')
      expect(user).not_to be_valid
    end

    it 'is not valid with a short password' do
      user = User.new(name: 'Tom Daniel', email: 'test@gmail.com', password: '123')
      expect(user).not_to be_valid
    end

    it 'is not valid with a long name' do
      user = User.new(name: 'T' * 51, email: 'test@gmail.com', password: '123456')
      expect(user).not_to be_valid
    end
  end

  describe 'devise modules' do
    it 'includes :database_authenticatable module' do
      expect(described_class.devise_modules).to include(:database_authenticatable)
    end

    it 'includes :registerable module' do
      expect(described_class.devise_modules).to include(:registerable)
    end

    it 'includes :recoverable module' do
      expect(described_class.devise_modules).to include(:recoverable)
    end

    it 'includes :rememberable module' do
      expect(described_class.devise_modules).to include(:rememberable)
    end

    it 'includes :validatable module' do
      expect(described_class.devise_modules).to include(:validatable)
    end
  end
end
