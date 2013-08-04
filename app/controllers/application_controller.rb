class ApplicationController < ActionController::Base
  protect_from_forgery


	helper_method:current_user 

	protected

	def after_sign_in_path_form(resources)
		new_contact_path
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id] 
	  end	
	  def logged_in? 
			!!current_user
		end

	private

	def authenticate 
		unless logged_in?
			flash[:error]="You must be logged into access this section of the site"
			redirect_to login_url
		end 
	end





end
