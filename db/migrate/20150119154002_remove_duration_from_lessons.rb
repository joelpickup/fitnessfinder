class RemoveDurationFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :duration
  end
end
