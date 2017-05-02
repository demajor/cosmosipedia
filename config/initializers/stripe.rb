# Store the environment variables on the Rails.configuration object
Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key: ENV['STRIPE_SECRET_KEY']
}

# Confirmation of API keys being read during initialization
# Set our app-stored secret key with Stripe
Rails.logger.info "key: #{ Rails.configuration.stripe[:publishable_key] }"
  Stripe.api_key = Rails.configuration.stripe[:secret_key]