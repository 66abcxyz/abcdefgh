class AddNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :image, :string
    add_column :users, :line1, :string
    add_column :users, :line2, :string
  end
end
