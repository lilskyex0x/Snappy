class CategoriesTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :transaction, foreign_key: 'transaction_ref_id'

  validates :category_id, presence: true
  validates :transaction_ref_id, presence: true
end
