class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :idea, counter_cache: :total_bookmarks
end
