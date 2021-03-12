class BadgesController < ApplicationController

  def index
    @current_user = current_user
    @badges = Badge.all
  end
end
