class LineItem < ActiveRecord::Base
	def total_price
		listing.price * quantity
	end

	belongs_to :listing
	belongs_to :cart
end
