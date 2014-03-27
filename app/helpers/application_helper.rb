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
      class: ([controller, action, version] - [nil]).join(' ')
    }
  end

  def admin_user?
    false
  end
  alias_method :admin?, :admin_user?

end
