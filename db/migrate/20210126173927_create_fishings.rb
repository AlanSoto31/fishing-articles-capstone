class CreateFishings < ActiveRecord::Migration[6.0]
  def change
    create_table :fishings do |t|
      t.references :author, index: true
      t.string :title
      t.text :text
      t.string :imagen

      t.timestamps
    end
    add_foreign_key :fishings, :users, column: :author_id
  end
end
