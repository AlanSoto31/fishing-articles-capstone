class CreateFishings < ActiveRecord::Migration[6.0]
  def change
    create_table :fishings do |t|
      t.references :authorid, null: false, foreign_key: true
      t.string :title
      t.text :text
      t.string :image

      t.timestamps
    end
  end
end
