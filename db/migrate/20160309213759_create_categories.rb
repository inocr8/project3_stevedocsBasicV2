class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :colour
      t.string :category_image
      t.text :description

      t.timestamps null: false
    end
  end
end
