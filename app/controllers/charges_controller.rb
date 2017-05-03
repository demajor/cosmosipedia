class ChargesController < ApplicationController

  def new
    @amount = Amount.new
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Upgrade - #{ current_user.email }",
     amount: @amount.default
    }
  end

  def create
    @amount = Amount.new
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: @amount.default,
      description: "Premium Upgrade - #{ current_user.email }",
      currency: 'usd'
    )

    # Set current_user to premium account
    current_user.premium!

    flash[:notice] = "Welcome to premium, #{ current_user.email }! You can now create private wikis."
    redirect_to wikis_path

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def delete
    if current_user.toggle_role
      flash[:notice] = "#{current_user.email} is now a #{current_user.role} member!"
    else
      flash[:alert] = "Doh! There was an error downgrading your account!"
    end
    redirect_to wikis_path
  end

  class Amount
    def default
      return 5_00
    end
  end
end
