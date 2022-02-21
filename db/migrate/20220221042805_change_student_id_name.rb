class ChangeStudentIdName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :student_id, :student_number
    rename_column :comments, :student_id, :student_number
    rename_column :ideas, :student_id, :student_number
    rename_column :ratings, :student_id, :student_number
  end
end
