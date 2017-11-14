class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :line1
      t.string :line2
      t.text :line3
      t.references :post, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
