# frozen_string_literal: true

FactoryBot.define do
  factory :registered, class: 'Role' do
    id { 1 }
    name { 'registered' }
    initialize_with { Role.find_or_create_by!(name: name) }
  end
end
