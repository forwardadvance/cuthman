class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :login_from_session

  def not_found
    render :file => "error/404", :status => :not_found
  end

  def current_user
    @current_user
  end

  def logged_in? args = {}
    minimum_level = args[:level] || :full
    @current_user != nil && @login != nil
  end

  def login l
    session[:session_key] = l.session_key
    @login = l
    @current_user = l.user
  end

  def logout
    session[:session_key] = nil
    @login = nil
    @current_user = nil
  end

  def last_edited_page_path
    (Page.find_by_id(session[:page_id]) || Page.root).path
  end

  private

    def login_from_session
      if session[:session_key]
        @login = Login.where(session_key: session[:session_key]).where("expires > ?", Time.now).first
        if @login
          @current_user = @login.user
          unless @current_user
            @login.destroy
            @login = nil
            session[:session_key] = nil
          end
        end
      end
    end
end
