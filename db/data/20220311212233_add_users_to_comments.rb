# frozen_string_literal: true

class AddUsersToComments < ActiveRecord::Migration[7.0]
  def up
    Comment.all.each do |comment|
      comment.update_attribute(:user, User.find_by_student_number(comment.student_number))
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
