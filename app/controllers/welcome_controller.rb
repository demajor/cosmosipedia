class WelcomeController < ApplicationController
  # skip_before_action :authenticate_user!

  def index
    @wikis = Wiki.all
  end

  def about
  end
end
