FactoryBot.define do
  factory :cab do

     vehicle_number {Faker::Vehicle.unique.license_plate}
     capacity { Faker::Number.between(from: 1, to: 200)}
     min_passengers { 1 }
    # valid_capacity {Faker::Number.between(from: 1, to: 200)}
    # invalid_capacity {Faker::Number.except(from: 1, to: 200)}
  end
end