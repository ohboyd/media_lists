class ApplicationController < ActionController::Base
  private

    def require_signin
      unless current_user
        session[:intended_url] = request.url
        redirect_to signin_path, alert: "Please sign in first!"
      end
    end
end
