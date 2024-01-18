require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  render_views

  before do
    @user = User.create!(name: 'APK', email: 'mailman@gmail.com', password: 'qwer123456')
    @category = Category.create!(name: 'Test Category', author: @user, icon: 'test.png')
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { category_id: @category.id }
      expect(response).to be_successful
      expect(assigns(:transactions)).not_to be_nil
      expect(assigns(:total_amount)).not_to be_nil
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { category_id: @category.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new Transaction' do
      transaction_attributes = {
        name: 'Test Transaction',
        amount: 50.0,
        category_id: @category.id
      }

      expect do
        post :create, params: { category_id: @category.id, transaction: transaction_attributes }
        puts response.body
      end.to change(Transaction, :count).by(1)

      expect(response).to redirect_to(category_transactions_path(@category))
      expect(flash[:notice]).to eq 'Transaction was successfully added.'
    end
  end
end
