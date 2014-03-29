module HasMetadata

  def self.extended(klass)
    klass.has_one :metadata
    klass.after_create :make_metadata
    klass.include InstanceMethods
  end

  module InstanceMethods
    def make_metadata
      Metadata.create page_id: self.id, title: slug.titleize, og_title: slug.titleize
    end
  end

end
