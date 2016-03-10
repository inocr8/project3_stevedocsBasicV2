class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :image, :string
    add_column :users, :company, :string
    add_column :users, :bio, :string
  end
end
