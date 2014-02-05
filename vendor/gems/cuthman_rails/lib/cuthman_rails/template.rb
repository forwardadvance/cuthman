module CuthmanRails
  class Template
    attr_writer :widget_locations

    def widget_locations
      widget_locations || {}
    end
  end
end
