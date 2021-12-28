# frozen_string_literal: true

FactoryBot.define do
  factory :brand, class: 'Brand' do
    name { Faker::Vehicle.manufacture }
    initialize_with { Brand.find_or_create_by!(name: name) }
  end
end
