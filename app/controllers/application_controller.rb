class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def not_found
    render :file => "error/404", :status => :not_found
  end

  def logged_in?
    false
  end

  def last_edited_page_path
    (Page.find_by_id(session[:page_id]) || Page.root).path
  end
end
