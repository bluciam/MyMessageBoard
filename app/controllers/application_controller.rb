class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  before_action :authenticate_user!

  ## has not been tested yet
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied to this resource."
    redirect_to root_url
  end
end
