class Idea < ApplicationRecord
  # TODO: add back when user model is complete
  belongs_to :user
  has_and_belongs_to_many :realms
  has_many :comments, inverse_of: :idea, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_and_belongs_to_many :markers, class_name: 'User', join_table: 'bookmarks', association_foreign_key: 'user_id'

  accepts_nested_attributes_for :comments, allow_destroy: true
  accepts_nested_attributes_for :ratings, allow_destroy: true
  accepts_nested_attributes_for :bookmarks, allow_destroy: true

  validates :title, :content, presence: true
  validates :student_number, numericality: :true

  scope :filter_by_student_number, ->(student_number) { where student_number: student_number }
  scope :filter_by_realm, ->(realm_id) { joins(:ideas_realms).where('ideas_realms.realm_id = ?', realm_id) }
  scope :filter_by_user, ->(user_id) { joins(:bookmarks).where('bookmarks.user_id = ?', user_id) }
end
