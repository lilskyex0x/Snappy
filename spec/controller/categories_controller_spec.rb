require 'rails_helper'

RSpec.describe 'Categories management', type: :request do
  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password123') }
  let(:category) { Category.create!(name: 'Test Category', icon: 'test_icon', author: user) }

  before do
    sign_in user
  end

  describe 'GET /categories' do
    it 'returns the categories index' do
      get '/categories'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /categories/new' do
    it 'returns the new category form' do
      get '/categories/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /categories' do
    it 'creates a new category' do
      post '/categories', params: { category: { name: 'New Category', icon: 'new_icon' } }
      expect(response).to redirect_to(categories_path)
      follow_redirect!
      expect(response.body).to include('New Category')
    end
  end
end
