module V1
    class CabSerializer
      include FastJsonapi::ObjectSerializer
      attributes :id, :vehicle_number, :capacity, :min_passengers
    end
end