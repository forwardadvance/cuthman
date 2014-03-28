module ApplicationHelper

  def error_messages_for resource, title = nil
    if resource.errors.any?
      title ||= "Sorry, there was a problem saving that #{resource.class.to_s}"
      render partial: "layouts/error_messages_for", locals: {resource: resource, title: title}
    end
  end

  def body_attributes
    controller = params[:controller].gsub('/', ' ')
    action = params[:action]
    version = @version ? "version_#{@version}" : nil
    {
      class: ([controller, action, version, ('logged_in' if logged_in?)] - [nil, false]).join(' ')
    }
  end

  def logged_in? args = {}
    @current_user != nil && @login != nil
  end

  def admin_user?
    logged_in? and current_user.admin?
  end
  alias_method :admin?, :admin_user?

  def current_user
    @current_user
  end

end
