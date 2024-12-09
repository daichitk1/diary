class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  include SessionsHelper
  
  private
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
end
