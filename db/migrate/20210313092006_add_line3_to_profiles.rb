class AddLine3ToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :line3, :string
    add_column :profiles, :line4, :string
    add_column :profiles, :line5, :string
    add_column :profiles, :line6, :string
    add_column :profiles, :line7, :string
    add_column :profiles, :line8, :string
    add_column :profiles, :line9, :string
    add_column :profiles, :line10, :string
    add_column :profiles, :line11, :text
    add_column :profiles, :line12, :text
    add_column :profiles, :line13, :text
    add_column :profiles, :line14, :text
    add_column :profiles, :line15, :text
    add_column :profiles, :line16, :text
  end
end
