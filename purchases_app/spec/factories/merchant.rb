FactoryBot.define do
  factory :merchant do
    name    { Faker::Name.unique.name }
    address { Faker::Address.street_address }    
  end
end
