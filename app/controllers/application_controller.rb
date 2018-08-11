class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "medic"
    end
  end

  def set_admin_locale
    I18n.locale = :pt-BR
  end  

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || medic_path
  end

  def authenticate2_user!
    if user_signed_in?
      
    else
      redirect_to login_path, :notice => 'if you want to add a notice'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :avatar, :email, :especialidade, :crm, :sobre, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :avatar, :email, :especialidade, :crm, :sobre, :password, :password_confirmation])
  end
end
