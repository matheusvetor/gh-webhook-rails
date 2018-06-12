# frozen_string_literal: true

class Issue < ApplicationRecord
  enum action: %i[open closed]

  validates :action, :repository_id, :repository_name, :owner_name, presence: true
end
