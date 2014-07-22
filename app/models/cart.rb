class Cart < ActiveRecord::Base
	
	def add_listing(listing_id)
		current_item = line_items.find_by_listing_id(listing_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(listing_id: listing_id)
		end
		current_item
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end

	def delivery_fee
		10
	end

	def total_order
		total_price + delivery_fee
	end

	has_many :line_items, dependent: :destroy
	belongs_to :merchant
	belongs_to :order
end
