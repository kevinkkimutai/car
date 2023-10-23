class CreateCars < ActiveRecord::Migration[7.0]
  def change
    unless table_exists? :cars
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :profile_image
      t.string :availability

      t.timestamps
    end
  end
end
end
