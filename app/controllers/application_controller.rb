class ApplicationController < ActionController::Base
	protect_from_forgery


	protected
	rescue_from CanCan::AccessDenied do |exception|
  	redirect_to login_path, alert: "You shall not pass!"
	end

end
