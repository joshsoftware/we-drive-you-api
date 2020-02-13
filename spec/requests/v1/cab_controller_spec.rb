# frozen_string_literal: true

require "rails_helper"

describe V1::CabController "Should create, delete, update, display cabs", type: :request do


    context "cab should be created" do

        it "returns ok when cab is created" do
            post "/cabs",
            params: {
                "cab": 
                {
                    "vehicle_number": "CK110",
                    "capacity": 2,
                    "min_passengers": 2
                }
            }
            expect(response).to have_http_status(:created)
        end
    end

end
