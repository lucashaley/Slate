class Comment < ApplicationRecord
  # TODO: add back when user model is complete
  belongs_to :user, counter_cache: :comments_count
  belongs_to :idea, counter_cache: :comments_count

  validates :content, :student_number, presence: true
end
