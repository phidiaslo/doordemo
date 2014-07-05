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
  
end