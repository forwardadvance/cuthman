class Page < ActiveRecord::Base

  has_one :metadatum
  has_many :widgets
  belongs_to :parent, :class_name => 'Page',
                      :foreign_key => 'parent_id'
  has_many :children, :class_name => 'Page',
                      :foreign_key => 'parent_id'

  after_create :make_metadata

  validates_presence_of :template

  class << self

    def root
      Page.where(parent_id: nil).first
    end

    def from_path path
      return root if path == ""
      path.split('/').inject(root) do |page, slug|
        return nil unless page
        Page.where(parent_id: page.id).where(slug:slug).first
      end
    end

  end

  def path
    el = self
    path = ""
    while el.parent_id
      path << "/#{el.slug}"
      el = el.parent
    end
    path
  end

  def make_metadata
    self.metadatum = Metadatum.create title: slug.titleize
    self.save
  end
end
