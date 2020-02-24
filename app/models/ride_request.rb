class RideRequest < ApplicationRecord
	validates :hop_id, :user_id, presence: true
	belongs_to :hop
	belongs_to :user
end
