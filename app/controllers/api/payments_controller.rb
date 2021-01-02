class Api::PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    order = Order.find(params[:order_id])
    payment_ststus = perform_payment(order)
    if payment_ststus
      order.update_attribute(:paid, true)
      render json: { message: 'Thank you! Your order will be ready in 20 minutes.' }
    else
      render json: { message: 'Something went wrong. Please try again.' }
    end
  end

  private

  def perform_payment(order)
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken],
      description: 'For payment of the current order'
    )
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: order.calculate_amount,
      currency: 'usd'
    )
    charge.paid
  end
end
