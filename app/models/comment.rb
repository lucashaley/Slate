class Comment < ApplicationRecord
  belongs_to :idea

  validates :content, :student_id, presence: true
end
