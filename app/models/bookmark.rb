class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :idea, counter_cache: :bookmarks_count
end
