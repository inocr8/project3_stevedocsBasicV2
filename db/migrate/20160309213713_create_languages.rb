class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :colour
      t.string :language_image
      t.text :description

      t.timestamps null: false
    end
  end
end
