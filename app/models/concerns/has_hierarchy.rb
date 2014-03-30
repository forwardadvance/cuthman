module HasHierarchy

  def self.included(klass)
    klass.belongs_to :parent, :class_name => 'Page',
                     :foreign_key => 'parent_id'
    klass.has_many :children, :class_name => 'Page',
                   :foreign_key => 'parent_id'
    klass.extend ClassMethods
    # TODO No way to prevent duplicate URLs
  end

  # Returns the path
  def path
    el = self
    path = []
    while el.parent_id
      path << "/#{el.slug}"
      el = el.parent
    end
    path.reverse.join
  end

  module ClassMethods
    # Finds the category hierarchy root
    def root
      self.where(parent_id: nil).first
    end

    # Retrieves a model from a URL
    def from_path path
      return root if path == ""
      path.split('/').inject(root) do |page, slug|
        return nil unless page
        self.where(parent_id: page.id).where(slug:slug).first
      end
    end
  end


end
