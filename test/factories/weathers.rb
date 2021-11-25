FactoryBot.define do
  factory :weather do
    date { Faker::Date.between(from: '1985-01-01', to: '1985-01-15') }
    weather_index { rand(1000) }
  end
end
