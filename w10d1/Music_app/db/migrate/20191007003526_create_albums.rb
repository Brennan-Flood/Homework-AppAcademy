class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :band_id, null: false
      t.integer :year, null: false
      t.boolean :studio, null: false

      t.timestamps
    end
    add_index :albums, :title
    add_index :albums, :band_id
    add_index :albums, [:band_id, :title], unique: true
    add_index :albums, :year

  end
end
