class AddImageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :image, :string
    add_column :profiles, :image, :string    
  end
end
