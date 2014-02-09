module PagesHelper

  def template
    render file: ['templates', @page.template].join('/')
  end
end
