# frozen_string_literal: true

FactoryBot.define do
  factory :issue do
    is_open { Faker::Boolean.boolean }
    kilometer { Faker::Number.between(from: 1, to: 500_000) }
    text { Faker::Lorem.sentence }
    vehicle { FactoryBot.create(:vehicle) }
  end
end
