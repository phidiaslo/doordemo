class Listing < ActiveRecord::Base
	if Rails.env.development?
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.png"
	validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
	else
	 has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.png",
	 :storage => :dropbox,
   	 :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
   	 :path => ":style/:id_:filename"
   	 validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
	end

	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates_attachment_presence :image

	belongs_to :merchant
	
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	private
		# ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end
end
