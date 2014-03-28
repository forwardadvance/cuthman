# This controller handles the login/logout function of the site.

class LoginsController < ApplicationController

  skip_before_filter :require_activation, :only => [:new, :destroy]

  def new
    @nav = :login
    @email = flash[:email]
  end

  def create
    @nav = :login
    @email = params[:email] || flash[:email]
    if params[:email].nil? or params[:password].nil?
      # Protect against bots hitting us.
      render :text => "" and return
    end
    user = User.where("email = lower(?)", params[:email].downcase).first
    if user && user.authenticate( params[:password] )
      # user is already logged in
      if user && logged_in?
        if user == @current_user
          # do nothing, user is already logged in
          redirect_to :root and return
        else
          # switch users
          @login.destroy
        end
      end
      @login = Login.create user: user
      login @login
      redirect_to :root
    else
      fail_message = "Sorry, your login details are incorrect. Please check that you have entered the correct email address and password. <a href='#{password_reminder_path}'>Forgot your password?</a>"
      if !params[:email].blank? || !params[:password].blank?
        flash[:login_error] = fail_message
      end
      render :new, :status => :forbidden
    end
  end


  def destroy
    if logged_in?
      session[:remember_me] = nil # being safety paranoid
      @login.destroy
      @login = nil
      @current_user = nil
      logout
    end
    redirect_to :root
  end
end
