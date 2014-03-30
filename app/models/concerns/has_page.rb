module HasPage
  def self.extended(klass)
    klass.belongs_to :page
    Page.has_many klass.to_s.pluralize.underscore.to_sym
    klass.after_create :make_page, :make_widgets
    klass.include InstanceMethods
  end

  module InstanceMethods

    def make_page
      self.page = Page.create parent_id: self.parent_page_id, slug: title.underscore, template: 'article' #TODO Fix this when slug is a duplicate
      self.save
    end

    def make_widgets
      page = self.page
      Widget.create resource: self, page: page, slot: "banner"
      Widget.create resource: self, page: page, slot: "article"
    end

    def parent_page_id=(id)
      @parent_page_id = id
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
      return page ? page.parent_id : @parent_page_id
    end
  end
end
