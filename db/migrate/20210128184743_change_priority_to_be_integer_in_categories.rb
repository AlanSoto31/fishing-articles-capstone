class ChangePriorityToBeIntegerInCategories < ActiveRecord::Migration[6.0]
  def up
    change_column :categories, :priority, :integer, using: 'priority::integer'
  end

  def down
    change_column :categories, :priority, :integer, using: 'priority::integer'
  end
end
