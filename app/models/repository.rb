class Repository < ApplicationRecord
  store :metadata, accessors: %w[name full_name], coder: JSON

  has_many :issues
end
