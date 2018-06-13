class Repository < ApplicationRecord
  store :metadata, accessors: %w[name full_name owner_name], coder: JSON

  has_many :issues, dependent: :destroy
end
