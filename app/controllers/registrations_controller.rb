class RegistrationsController < Devise::RegistrationsController
  after_action :greeting_message, only: :create

  def greeting_message
    flash[:notice] = "Hello! #{current_user.first_name} #{current_user.last_name}!"
  end
end