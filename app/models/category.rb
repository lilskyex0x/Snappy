class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :categories_transactions, dependent: :destroy
  has_many :transaction_records, class_name: 'Transaction', through: :categories_transactions, source: :transaction_record, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  validates :author_id, presence: true

  def total_transaction_amount
    transaction_records.to_a.sum(&:amount)
  end
end
