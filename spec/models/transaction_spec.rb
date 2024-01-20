require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'belongs to author with foreign key author_id' do
    should respond_to(:author)
    association = described_class.reflect_on_association(:author)
    expect(association.foreign_key.to_sym).to eq :author_id
  end

  it 'has many categories_transactions' do
    should respond_to(:categories_transactions)
  end

  it 'has many categories through categories_transactions' do
    should respond_to(:categories)
  end

  it 'validates presence of name' do
    transaction = Transaction.new(name: nil)
    transaction.valid?
    expect(transaction.errors[:name]).to include("can't be blank")
  end

  it 'validates presence of amount' do
    transaction = Transaction.new(amount: nil)
    transaction.valid?
    expect(transaction.errors[:amount]).to include("can't be blank")
  end

  it 'validates numericality of amount' do
    transaction = Transaction.new(amount: 'abc')
    transaction.valid?
    expect(transaction.errors[:amount]).to include('is not a number')
  end

  it 'validates presence of author_id' do
    transaction = Transaction.new(author_id: nil)
    transaction.valid?
    expect(transaction.errors[:author_id]).to include("can't be blank")
  end
end
