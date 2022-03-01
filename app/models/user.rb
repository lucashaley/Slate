class User < ApplicationRecord
  # TODO add back when user model is complete
  # has_many :ideas
  acts_as_favoritor
end
