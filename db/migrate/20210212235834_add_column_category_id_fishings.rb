class AddColumnCategoryIdFishings < ActiveRecord::Migration[6.0]
  def change
    add_column :fishings, :category_id, :integer
  end
end
