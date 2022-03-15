class Rating < ApplicationRecord
  belongs_to :idea
  belongs_to :user

  validates :viability, :impact, presence: true
end
