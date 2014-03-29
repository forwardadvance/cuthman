class Page < ActiveRecord::Base

  extend HasMetadata

  belongs_to :parent, :class_name => 'Page',
                      :foreign_key => 'parent_id'
  has_many :children, :class_name => 'Page',
                      :foreign_key => 'parent_id'

  has_many :widgets

  validates_presence_of :template
  validates_presence_of :slug

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

end
