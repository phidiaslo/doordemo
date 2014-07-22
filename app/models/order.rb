class Order < ActiveRecord::Base
	PAYMENT_TYPES = [ "Cash on delivery" ]

	def add_line_items_from_cart(cart)
	  cart.line_items.each do |item|
		item.cart_id = nil
		line_items << item
	  end
	end

	validates :delivery_date, :delivery_time, :address, presence: true
    validates :pay_type, inclusion: PAYMENT_TYPES

    has_many :line_items, dependent: :destroy
    belongs_to :user
    belongs_to :merchant
end
