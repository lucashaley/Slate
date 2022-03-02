class Idea < ApplicationRecord
  # TODO add back when user model is complete
  # belongs_to :user
  has_and_belongs_to_many :realms
  has_many :comments, inverse_of: :idea, dependent: :destroy
  has_many :ratings

  accepts_nested_attributes_for :comments, :allow_destroy => true
  accepts_nested_attributes_for :ratings, :allow_destroy => true

  validates :title, :content, presence: true
  validates :student_number, numericality: :true

  scope :search_query, -> (query) {}
  scope :sorted_by, -> {}
  scope :filter_by_student_number, -> (student_number) { where student_number: student_number }
  scope :filter_by_realm, -> (realm_id) {joins(:ideas_realms).where('ideas_realms.realm_id = ?', realm_id)}
  # scope :filter_by_favorite, -> (user_id) { joins(:favorites).where('favorites.favoritor_id = 1000') }

  acts_as_favoritable

  # filterrific(
  #   default_filter_params: { sorted_by: 'created_at_desc' },
  #   available_filters: [
  #     :sorted_by,
  #     :search_query,
  #     :filter_by_student_number,
  #     :filter_by_realm
  #   ]
  # )

  def self.options_for_sorted_by
    [
      ["Title (a-z)", "title_asc"],
      ["Date (newest first)", "created_at_desc"]
    ]
  end
end
