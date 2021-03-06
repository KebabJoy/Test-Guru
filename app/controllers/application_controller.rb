class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :add_permitted_parameters, if: :devise_controller?

  def add_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
      if resource.is_a?(Admin)
        admin_root_path
      else
        super
      end
  end
end
