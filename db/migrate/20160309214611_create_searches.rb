class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.references :user, index: true, foreign_key: true
      t.references :document, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true
      t.references :library, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
