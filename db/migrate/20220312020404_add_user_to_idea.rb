class AddUserToIdea < ActiveRecord::Migration[7.0]
  def change
    add_reference :ideas, :user, null: true, foreign_key: true
  end
end
