class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    unless table_exists? :photos
    create_table :photos do |t|
      t.references :car, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
end