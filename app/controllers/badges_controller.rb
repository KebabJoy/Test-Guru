class BadgesController < ApplicationController

  def index
    @badges = Badge.all
  end

  def edit; end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
