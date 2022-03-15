class AddUserToRatings < ActiveRecord::Migration[7.0]
  def change
    add_reference :ratings, :user, null: true, foreign_key: true
  end
end
