module HasImage

  def image_styles
    {:styles => { :medium => "300x300>", :thumb => "100x100>" }}
  end

  def add_attachment
    opts = image_styles.merge(:default_url: "/images/:style/missing.png")
    has_attached_file :image, opts
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  end
end
