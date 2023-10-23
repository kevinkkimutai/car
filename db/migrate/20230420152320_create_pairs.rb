class CreatePairs < ActiveRecord::Migration[7.0]
  def change
    unless table_exists? :pairs
    create_table :pairs do |t|
      t.string :my_custom_id
      t.string :week_no
      t.string :student1_id
      t.string :student2_id
      t.string :student1_user_id
      t.string :student2_user_id

      t.timestamps
    end
  end
end
end