module HasPage
  def self.extended(klass)
    klass.belongs_to :page
    Page.has_many klass.to_s.pluralize.underscore.to_sym
    klass.after_create :make_page
    klass.include InstanceMethods
  end

  module InstanceMethods

    def make_page
      self.page = Page.create parent_id: parent_page_id, slug: title.underscore, template: 'article' #TODO Fix this when slug is a duplicate
      self.save
    end

    def parent_page_id=(id)
      page = self.page
      if page
        page.parent_id = id
        page.save
      else
        make_page
      end
    end

    def parent_page_id
      page = self.page
      return page ? page.parent_id : nil
    end
  end
end
