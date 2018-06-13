# frozen_string_literal: true

class Issue < ApplicationRecord
  store :metadata, accessors: %w[title state body], coder: JSON

  belongs_to :repository

  validates :action, :repository, presence: true

  delegate :name, to: :repository, prefix: true
end
