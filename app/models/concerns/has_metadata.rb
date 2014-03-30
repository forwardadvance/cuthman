module HasMetadata

  def self.included(klass)
    klass.has_one :metadata
    klass.after_create :make_metadata
  end

  def make_metadata
    Metadata.create page_id: self.id, title: slug.titleize, og_title: slug.titleize
  end

end
