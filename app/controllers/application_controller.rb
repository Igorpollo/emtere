class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "medic"
    end
  end
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || medic_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :email, :especialidade, :crm, :sobre, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :email, :especialidade, :crm, :sobre, :password, :password_confirmation])
  end
end
