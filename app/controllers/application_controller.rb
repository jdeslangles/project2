class ApplicationController < ActionController::Base
	protect_from_forgery


	protected
	def after_sign_in_path_form(resources)
		new_contact_path
	end

	rescue_from CanCan::AccessDenied do |exception|
  	redirect_to login_path, alert: "You shall not pass!"
	end

end
