# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle, class: 'Vehicle' do
    name { Faker::Vehicle.model }
    license_plate { Faker::Vehicle.license_plate }
    serial_number { Faker::Vehicle.vin }
    tax_horsepower { Faker::Number.between(from: 1, to: 100) }
    brand { FactoryBot.create(:brand) }
    department { FactoryBot.create(:department) }
  end
end
