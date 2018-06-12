# frozen_string_literal: true

FactoryBot.define do
  factory :issue do
    sequence(:repository_id) { |n| n }
    action          { :open }
    repository_name { Faker::Internet.user_name(%w[_ -]) }
    owner_name      { Faker::Internet.user_name }
  end
end
