module PagesHelper

  def template
    render file: ['templates', @page.template].join('/')
    @page.template
  end
end
