require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
    @category = categories(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get category_transactions_url(@category)
    assert_response :success
  end

  test 'should get new' do
    get new_category_transaction_url(@category)
    assert_response :success
  end

  test 'should create transaction' do
    assert_difference('Transaction.count') do
      post category_transactions_url(@category),
           params: { transaction: { amount: @transaction.amount, name: @transaction.name, category_id: @category.id } }
    end

    assert_redirected_to category_transactions_url(@category)
  end

  test 'should show transaction' do
    get category_transaction_url(@category, @transaction)
    assert_response :success
  end
end
