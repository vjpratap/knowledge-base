FactoryBot.define do
  factory :user do
    name { "Vijay" }
    email { "vijay@email.com" }
    password_digest { "password" }
  end
end
