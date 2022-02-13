class Idea < ApplicationRecord
  has_and_belongs_to_many :realms
  has_many :comments, inverse_of: :idea, dependent: :destroy

  accepts_nested_attributes_for :comments, :allow_destroy => true

  validates :title, :content, presence: true
end
