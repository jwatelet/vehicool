# frozen_string_literal: true

FactoryBot.define do
  factory :department, class: 'Department' do
    name { Faker::Company.name }
    initialize_with { Department.find_or_create_by!(name: name) }
  end
end
