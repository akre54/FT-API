FactoryGirl.define do 

  factory :farm do
    email Faker::Internet.email
    farm_name Faker::Company.name
    pass Faker::Lorem.words 1
    salt Faker::Lorem.words 1
  end

  factory :customer do
    name Faker::Name.name
    email Faker::Internet.email
    salt Faker::Lorem.words 1
    crypted_pin Faker::Lorem.words 1
  end

  factory :tab do
    association :farm
    association :customer
    balance '78.44'
  end

end
