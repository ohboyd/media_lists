class ApplicationController < ActionController::Base

  private

    def require_signin
      unless current_user
        session[:intended_url] = request.url
        redirect_to signin_path, alert: "Please sign in first!"
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    # for future use if I want to be able to specify which user I'm giving access to things (like if I decide to use an
    # admin and give other users a different ability)
    def current_user?(user)
      current_user == user
    end

    helper_method :current_user?
end
