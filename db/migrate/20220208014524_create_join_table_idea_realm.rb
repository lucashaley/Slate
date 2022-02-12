class CreateJoinTableIdeaRealm < ActiveRecord::Migration[7.0]
  def change
    create_join_table :ideas, :realms do |t|
      # t.index [:idea_id, :realm_id]
      # t.index [:realm_id, :idea_id]
    end
  end
end
