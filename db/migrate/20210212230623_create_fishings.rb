class CreateFishings < ActiveRecord::Migration[6.0]
  def change
    create_table :fishings do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.string :imagen

      t.timestamps
    end
  end
end
