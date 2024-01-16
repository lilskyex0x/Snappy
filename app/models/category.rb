class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :categories_transactions
  has_many :transactions, through: :categories_transactions, source: :transaction_ref

  validates :name, presence: true
  validates :icon, presence: true
  validates :author_id, presence: true

  def total_transaction_amount
    transactions.sum(:amount)
  end
end
