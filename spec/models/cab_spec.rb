# frozen_string_literal: true

require "rails_helper"

RSpec.describe Cab, type: :model do

  # before(:all) do
  #     @organization1 = FactoryBot.create(:organization)
  # end

  it "vehicle number not nil" do
    cab = FactoryBot.create(:cab,vehicle_number: nil)
    expect(cab).to_not be_valid
  end

  it "capacity not nil" do
    cab = Cab.create(capacity: nil)
    expect(cab).to_not be_valid
  end

  it "minimum passengers not nil" do
    cab = Cab.create(min_passengers: nil)
    expect(cab).to_not be_valid
  end

  # it "has a unique vehicle number" do
  #   cab = Cab.create(vehicle_number: vehicle_number )
  #   expect(cab).to be_valid
  # end

  it "should not accept min passengers greater than cab capacity" do
    cab = Cab.create(min_passengers: 3, capacity: 2)
    expect(cab).to_not be_valid
  end

  it "should not accept same vehicle number" do
    cab1 = Cab.create(vehicle_number: "DEP-2483")
    cab2 = Cab.create(vehicle_number: "DEP-2483")
    expect(cab2).to_not be_valid
  end

  # it "should have capacity between 0 to 200" do
  #   cab = FactoryBot.create(:cab, capacity: invalid_capacity)
  #   expect(cab).to_not be valid
  # end

end
