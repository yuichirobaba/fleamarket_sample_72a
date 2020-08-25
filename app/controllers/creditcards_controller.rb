class CreditcardsController < ApplicationController

  def new
    creditcard = Creditcard.where(create_user_id: current_create_user.id)
    redirect_to creditcard_path(current_create_user.id) if creditcard.exists?
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    if params['payjp-token'].blank?
      redirect_to new_creditcard_path
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {create_user_id: current_create_user.id}
      )
      @creditcard = Creditcard.new(create_user_id: current_create_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @creditcard.save
        redirect_to creditcard_path(current_create_user.id)
      else
        redirect_to pay_creditcards_path
      end
    end
  end

  def destroy
    creditcard = Creditcard.find_by(create_user_id: current_create_user.id)
    if creditcard.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(creditcard.customer_id)
      customer.delete
      creditcard.delete
    end
    redirect_to new_creditcard_path
  end

  def show
    creditcard = Creditcard.find_by(create_user_id: current_create_user.id)
    if creditcard.blank?
      redirect_to new_creditcard_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(creditcard.customer_id)
      @default_card_information = customer.cards.retrieve(creditcard.card_id)
    end
  end
end
