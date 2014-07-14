class Merchant < ActiveRecord::Base
  if Rails.env.development?
  has_attached_file :logo, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.png"
  validates_attachment_content_type :logo, :content_type => %w(image/jpeg image/jpg image/png)
  else
   has_attached_file :logo, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.png",
   :storage => :dropbox,
     :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
     :path => ":style/:id_:filename"
     validates_attachment_content_type :logo, :content_type => %w(image/jpeg image/jpg image/png)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :restaurant_name, :restaurant_phone, :address, :postcode, :area, :city, :state,
            :name, presence: true

  has_many :listings, dependent: :destroy
  has_many :orders, dependent: :destroy
end
