class Pitch < ApplicationRecord
  belongs_to :user, inverse_of: :pitches
  belongs_to :idea
  has_many :creatives
  has_many :core_creatives, through: :creatives, source: :users
  belongs_to :brief

  validates_presence_of :title, :logline, :synopsis, :brief
  
  accepts_nested_attributes_for :creatives, allow_destroy: true

  has_paper_trail
  
  # https://medium.com/@ryanwerner_57863/how-to-build-a-nested-form-in-rails-using-fields-for-c185210f6869
  def creatives_attributes=(creatives_attributes)
    creatives_attributes.each do |i, creative_attribute|
      self.creatives.build(creative_attribute)
    end
  end
end
