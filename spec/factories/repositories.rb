FactoryBot.define do
  factory :repository do
    metadata {{
      name: Faker::Internet.user_name(%w[_ -]),
      full_name: Faker::Internet.user_name(%w[_ -]),
      description: Faker::Lorem.paragraph
    }}
  end
end
