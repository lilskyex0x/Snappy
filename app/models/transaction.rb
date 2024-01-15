class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :categories_transactions
  has_many :categories, through: :categories_transactions

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :author_id, presence: true
  validate :must_have_at_least_one_category

  private

  def must_have_at_least_one_category
    errors.add(:base, 'must belong to at least one category') if categories.empty?
  end
end
