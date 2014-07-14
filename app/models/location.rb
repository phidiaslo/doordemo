class Location < ActiveRecord::Base
	validates :location_name, :location_area, :location_address, presence: true

	belongs_to :user
end
