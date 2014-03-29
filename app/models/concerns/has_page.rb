module HasPage
  def self.extended(klass)
    klass.belongs_to :page
    Page.has_many klass.to_s.pluralize.underscore.to_sym
    klass.after_create :make_page
    klass.include InstanceMethods
  end

  module InstanceMethods
    attr_accessor :parent_page_id

    def make_page
      self.page = Page.create parent_id: parent_page_id, slug: title.underscore, template: 'article' #TODO Fix this when underscore is a duplicate
      self.save
    end
  end
end
