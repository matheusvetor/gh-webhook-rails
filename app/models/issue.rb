# frozen_string_literal: true

class Issue < ApplicationRecord
  store :metadata, accessors: %w[title state body], coder: JSON

  belongs_to :repository

  validates :action, :repository, presence: true

  delegate :name, to: :repository, prefix: true
  delegate :owner_name, to: :repository

  def as_json(options = nil)
    super({
      only: %w[id action repository_id created_at updated_at],
      methods: %w[repository_name owner_name]
    }.merge(options || {}))
  end
end
