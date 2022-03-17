class ResetCounterCacheForUsers < ActiveRecord::Migration[7.0]
  def up
    User.all.each do |user|
      User.reset_counters(user.id, :comments)
      User.reset_counters(user.id, :ideas)
    end
  end
end
