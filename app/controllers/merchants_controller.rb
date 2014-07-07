class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def lintas
    @merchants = Merchant.where(:area => "Lintas")
  end

  def damai
    @merchants = Merchant.where(:area => "Damai")
  end

  def show
    @merchant = Merchant.find(params[:id])
    @listings = Listing.where(:merchant_id => params[:id])
  end
end