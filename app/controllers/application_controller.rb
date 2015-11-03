class ApplicationController < ActionController::Base

before_action :authenticate, only: [:index, :show, :edit, :update, :destroy]

  protect_from_forgery with: :exception

  private


    helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def authorize
      redirect_to login_path, alert: 'Not authorized - you must be logged in!' if current_user.nil?
    end

        def authenticate
      redirect_to '/login', alert: "You must login to continue!" if current_user.nil?
    end


end
