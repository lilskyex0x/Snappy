require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'belongs to author with foreign key author_id' do
    should respond_to(:author)
    association = described_class.reflect_on_association(:author)
    expect(association.foreign_key.to_sym).to eq :author_id
  end

  it 'has many categories_transactions' do
    should respond_to(:categories_transactions)
  end

  it 'has many transaction_records through categories_transactions' do
    should respond_to(:transaction_records)
  end

  it 'validates presence of name' do
    category = Category.new(name: nil)
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'validates presence of icon' do
    category = Category.new(icon: nil)
    category.valid?
    expect(category.errors[:icon]).to include("can't be blank")
  end

  it 'validates presence of author_id' do
    category = Category.new(author_id: nil)
    category.valid?
    expect(category.errors[:author_id]).to include("can't be blank")
  end
end
