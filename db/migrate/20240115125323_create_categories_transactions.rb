class CreateCategoriesTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_transactions do |t|
      t.references :category, null: false, foreign_key: true
      t.references :transaction_ref, null: false, foreign_key: { to_table: :transactions }

      t.timestamps
    end
  end
end
