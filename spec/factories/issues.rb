# frozen_string_literal: true

FactoryBot.define do
  factory :issue do
    action     { 'open' }
    repository
  end
end
