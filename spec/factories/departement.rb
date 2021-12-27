FactoryBot.define do
  factory :department, class: "Department" do
    name { Faker::Company.name }
  end
end
