class Realm < ApplicationRecord
  has_and_belongs_to_many :ideas
end
