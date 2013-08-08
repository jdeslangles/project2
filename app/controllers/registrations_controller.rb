class RegistrationsController < Devise::RegistrationsController

  protected
  def after_inactive_sign_up_path_for(resource)
    thanks_for_registering_path
  end
end