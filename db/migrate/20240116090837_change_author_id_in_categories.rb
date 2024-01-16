class ChangeAuthorIdInCategories < ActiveRecord::Migration[7.1]
  def change
    change_column_null :categories, :author_id, false
  end
end
