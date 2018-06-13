# frozen_string_literal: true

class Issue < ApplicationRecord
  belongs_to :repository

  validates :action, :repository, presence: true

  delegate :name, to: :repository, prefix: true
end
