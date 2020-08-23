class BuyersController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_product

  def index
    if @creditcard.blank?
      redirect_to new_creditcard_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@creditcard.customer_id)
      @default_card_information = customer.cards.retrieve(@creditcard.card_id)
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      :amount => @product.price,
      :customer => @creditcard.customer_id,
      :currency => 'jpy',
    )
    redirect_to done_products_detail_buyers_path
  end

  def done

  end


  private

  def set_card
    @creditcard = Creditcard.find_by(create_user_id: current_create_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
end
