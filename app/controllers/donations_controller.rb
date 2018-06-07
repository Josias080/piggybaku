class DonationsController < ApplicationController
  def new
    @feeling = Feeling.find(params[:feeling_id])
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @feeling.amount_cents,
      description:  "Payment for teddy #{@order.teddy_sku} for order #{@order.id}",
      currency:     @feeling.amount.currency
    )

    @feeling.update(donation: charge.to_json, is_donated: true)
    redirect_to feeling_path(@feeling)

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to feeling_path(@feeling)
  end
end
