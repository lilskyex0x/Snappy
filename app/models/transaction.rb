class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :categories_transactions, foreign_key: 'transaction_ref_id', dependent: :destroy
  has_many :categories, through: :categories_transactions, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :author_id, presence: true
end
