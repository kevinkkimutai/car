class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    unless table_exists? :feedbacks
    create_table :feedbacks do |t|
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
  end
end
end
