class ResetAllCommentAndBookmarkCacheCounters < ActiveRecord::Migration[7.0]
  def up
    Idea.all.each do |idea|
      Idea.reset_counters(idea.id, :comments)
      Idea.reset_counters(idea.id, :bookmarks)
    end
  end
end
