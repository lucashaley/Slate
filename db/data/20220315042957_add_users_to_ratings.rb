# frozen_string_literal: true

class AddUsersToRatings < ActiveRecord::Migration[7.0]
  def up
    Rating.all.each do |rating|
      rating.update_attribute(:user, User.find_by_student_number(rating.student_number))
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
