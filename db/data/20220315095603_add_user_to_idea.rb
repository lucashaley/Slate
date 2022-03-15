# frozen_string_literal: true

class AddUserToIdea < ActiveRecord::Migration[7.0]
  def up
    Idea.all.each do |idea|
      idea.update_attribute(:user, User.find_by_student_number(idea.student_number))
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
