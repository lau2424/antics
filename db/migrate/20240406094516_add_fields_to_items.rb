class AddFieldsToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :name, :string, null: false
    add_column :items, :style, :string, null: false
    add_column :items, :height, :integer, null: false
    add_column :items, :depth, :integer, null: false
    add_column :items, :status, :string, null: false
    add_column :items, :matter, :string, null: false
  end
end
