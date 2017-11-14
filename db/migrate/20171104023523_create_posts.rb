class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :line1
      t.string :line2
      t.string :line3
      t.text :line4
      t.references :profile, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
