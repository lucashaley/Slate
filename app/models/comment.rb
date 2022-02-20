class Comment < ApplicationRecord
  # TODO add back when user model is complete
  # belongs_to :user
  belongs_to :idea

  validates :content, :student_id, presence: true
end
