class DonationsController < ApplicationController
  def new
    @feeling = Feeling.find(params[:feeling_id])
  end

  def create
    @feeling = Feeling.find(params[:feeling_id])
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @feeling.price_cents,
      description:  "Donation from #{@feeling.user.username}",
      currency:     @feeling.price.currency
    )

    @feeling.update(donation: charge.to_json, is_donated: true)
    redirect_to thankyou_feeling_path(@feeling)

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_feeling_donations_path(@feeling)
  end
end
