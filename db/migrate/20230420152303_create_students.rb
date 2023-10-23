class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    unless table_exists? :students
    create_table :students do |t|
      t.string :fullname
      t.float :grade
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
end