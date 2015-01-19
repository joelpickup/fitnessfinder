class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :description
      t.datetime :duration
      t.integer :price
      t.integer :instructor_id

      t.timestamps
    end
  end
end
