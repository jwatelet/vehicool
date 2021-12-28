# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role { FactoryBot.create(:registered) }
    initialize_with { User.find_or_create_by(email: email) }
  end
end
