module Widgetable

  def self.extended(klass)
    klass.has_page
  end

  def has_page
    has_one :page
  end
end
