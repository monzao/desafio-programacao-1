FactoryBot.define do
  factory :item do
    description { Faker::Lorem.sentence }
    merchant    { nil }
    prices      { rand(10..500).to_f }
  end
end
