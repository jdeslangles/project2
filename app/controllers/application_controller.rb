class ApplicationController < ActionController::Base
	protect_from_forgery

	rescue_from CanCan::AccessDenied do |exception|
  	redirect_to login_path, alert: "You shall not pass!"
	end


	protected
	rescue_from CanCan::AccessDenied do |exception|
  	redirect_to login_path, alert: "You shall not pass!"
	end

end
