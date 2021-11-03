FactoryBot.define do
  factory :user do
    id { 1 }
    email { "test@user.com" }
    password { "qwerty" }
    role { FactoryBot.create(:registered) }
  end
end
