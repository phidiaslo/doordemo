class LineItem < ActiveRecord::Base
	def total_price
		listing.price * quantity
	end

	belongs_to :order
	belongs_to :listing
	belongs_to :cart
	belongs_to :merchant
end
