FactoryBot.define do
  factory :brand, class: "Brand" do
    name { Faker::Vehicle.manufacture }
  end
end
