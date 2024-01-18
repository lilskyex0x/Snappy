require 'rails_helper'

RSpec.describe User do
  it 'has many authored_categories with foreign key author_id' do
    should respond_to(:authored_categories)
    association = described_class.reflect_on_association(:authored_categories)
    expect(association.foreign_key.to_sym).to eq :author_id
  end

  it 'has many authored_transactions with foreign key author_id' do
    should respond_to(:authored_transactions)
    association = described_class.reflect_on_association(:authored_transactions)
    expect(association.foreign_key.to_sym).to eq :author_id
  end

  it 'validates presence of name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  
  it 'validates presence of email' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  
  it 'validates uniqueness of email' do
    User.create!(email: 'stickman@gmail.com', name: 'Test', password: 'password123')
    user = User.new(email: 'stickman@gmail.com', password: 'password123')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end
end
