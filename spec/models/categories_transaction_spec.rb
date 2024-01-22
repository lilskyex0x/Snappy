require 'rails_helper'

RSpec.describe CategoriesTransaction, type: :model do
  it 'belongs to category' do
    should respond_to(:category)
    association = described_class.reflect_on_association(:category)
    expect(association.foreign_key.to_sym).to eq :category_id
  end

  it 'belongs to transaction_record with foreign key transaction_ref_id' do
    should respond_to(:transaction_record)
    association = described_class.reflect_on_association(:transaction_record)
    expect(association.foreign_key.to_sym).to eq :transaction_ref_id
  end

  it 'validates presence of category_id' do
    categories_transaction = CategoriesTransaction.new(category_id: nil)
    categories_transaction.valid?
    expect(categories_transaction.errors[:category_id]).to include("can't be blank")
  end

  it 'validates presence of transaction_ref_id' do
    categories_transaction = CategoriesTransaction.new(transaction_ref_id: nil)
    categories_transaction.valid?
    expect(categories_transaction.errors[:transaction_ref_id]).to include("can't be blank")
  end
end
