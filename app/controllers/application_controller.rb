class ApplicationController < ActionController::Base

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      tests_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
