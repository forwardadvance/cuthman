module ActiveRecord
  class Base
    class << self
      def acts_as_widget settings={}
        Widget.register_widget self
      end
    end
  end
end