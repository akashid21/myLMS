FactoryBot.define do
  factory :admin do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    age { Faker::Number.between(from: 2, to: 80).to_i }
    password { '123456' }
  end
end