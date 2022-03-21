class User < ApplicationRecord
  # TODO: add back when user model is complete
  has_many :ideas
  has_many :comments
  has_many :ratings

  has_many :bookmarks, -> { includes :idea }
  has_and_belongs_to_many :marks, class_name: 'Idea', join_table: 'bookmarks', association_foreign_key: 'idea_id'

  scope :with_student_number, ->(student_number) { where("student_number = ?", student_number) }

  scope :order_by_comment_count, -> { order(comments_count: :desc) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.top_by_comment_count
    order('comments_count desc').limit(10)
  end
end
