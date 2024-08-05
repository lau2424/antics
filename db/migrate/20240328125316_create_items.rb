class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.integer :price
      t.text :content
      t.string :category
      t.integer :width
      t.integer :length
      t.string :century
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
