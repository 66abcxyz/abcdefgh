class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :line1
      t.string :line2
      t.integer :user_id

      t.timestamps
    end
  end
end
