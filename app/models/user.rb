class User < ApplicationRecord
  # TODO: add back when user model is complete
  has_many :ideas
  has_many :comments
  has_many :ratings
  has_many :ideas
  has_many :pitches, inverse_of: :user
  has_many :creatives
  has_many :pitches, through: :creatives

  has_many :bookmarks, -> { includes :idea }
  has_and_belongs_to_many :marks, class_name: 'Idea', join_table: 'bookmarks', association_foreign_key: 'idea_id'

  scope :with_student_number, ->(student_number) { where("student_number = ?", student_number) }

  scope :order_by_comment_count, -> { order(comments_count: :desc) }
  scope :comment_count_is_not_null, -> { where("comments_count is not null") }

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.top_by_comment_count
    where("comments_count is not null").order('comments_count desc').limit(10).to_a
  end

  def self.top_by_idea_count
    where("ideas_count is not null").order('ideas_count desc').limit(10).to_a
  end
end
