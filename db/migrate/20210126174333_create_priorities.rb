class CreatePriorities < ActiveRecord::Migration[6.0]
  def change
    create_table :priorities do |t|
      t.string :name
      t.string :priority

      t.timestamps
    end
  end
end
