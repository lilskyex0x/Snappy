require 'rails_helper'

RSpec.describe 'Transactions management', type: :request do
  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password123') }
  let(:category) { Category.create!(name: 'Test Category', icon: 'test_icon', author: user) }
  let(:transaction) { Transaction.create!(name: 'Test Transaction', amount: 100, author: user, category:) }

  before do
    sign_in user
  end

  describe 'GET /categories/:category_id/transactions' do
    it 'returns the transactions index' do
      get category_transactions_path(category)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /categories/:category_id/transactions/new' do
    it 'returns the new transaction form' do
      get new_category_transaction_path(category)
      expect(response).to have_http_status(:success)
    end
  end
end
