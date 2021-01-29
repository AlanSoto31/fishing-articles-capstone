class AddCategoryToFishings < ActiveRecord::Migration[6.0]
  def change
    add_reference :fishings, :category, index: true
    add_foreign_key :fishings, :categories
  end
end
