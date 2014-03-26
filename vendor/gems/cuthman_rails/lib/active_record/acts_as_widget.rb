module ActiveRecord
  class Base
    class << self
      def acts_as_widget settings={}
        Widget.register_widget self
      end
    end
    def place_widget_on

    end
  end
end