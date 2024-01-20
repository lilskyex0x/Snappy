require 'rails_helper'

RSpec.describe 'Categories index', type: :feature do
  let!(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password1235') }
  let!(:category) { Category.create!(name: 'Test Category', icon: 'test_icon.png', author: user) }

  before do
    login_as(user, scope: :user)
    visit categories_path
  end

  it 'displays categories' do
    expect(page).to have_content('Test Category')
    expect(page).to have_css("img[src*='test_icon.png']")
  end

  it 'links to category transactions' do
    click_link 'Test Category'
    expect(page).to have_current_path(category_transactions_path(category))
  end

  it 'links to new category form' do
    click_link 'New Category'
    expect(page).to have_current_path(new_category_path)
  end
end
