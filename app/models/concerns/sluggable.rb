module Sluggable
  def self.included(klass)
    klass.before_save :slugify
  end

  def slugify
    self.slug = self.slug.downcase.gsub(/\s+/, '-')
  end
end
