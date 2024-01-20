require 'rails_helper'

RSpec.describe 'New Category', type: :feature do
  let!(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password1235') }

  before do
    login_as(user, scope: :user)
    visit new_category_path
  end

  it 'displays the new category form' do
    expect(page).to have_css('.new-category-form')
  end

  it 'creates a new category when the form is submitted' do
    fill_in 'Category Name', with: 'Test Category'
    fill_in 'Category Icon', with: 'test_icon.png'
    click_button 'Create Category'

    expect(Category.count).to eq(1)
    expect(Category.first.name).to eq('Test Category')
    expect(Category.first.icon).to eq('test_icon.png')
  end
end
