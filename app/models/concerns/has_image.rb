module HasImage

  def self.extended(klass)
    klass.add_attachments
  end

  def image_styles
    {:styles => { :landscape => "297x210#", :large_landscape => "594x420#" }}
  end

  def banner_styles
    {:styles => { :widescreen => "1500x375#", :desktop => "960x240#" }}
  end

  def s3_credentials
    if Rails.env.development?
      return {}
    else
      return {
        :storage => :s3,
        :bucket => ENV['S3_BUCKET_NAME'], #st-cuthmans
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
        }
      }
    end
  end

  def add_attachments
    has_attached_file :image, image_styles
      .merge(default_url: "/images/:style/missing.png")
      .merge(s3_credentials)
    has_attached_file :banner, banner_styles
      .merge(default_url: "/images/:style/missing_banner.png")
      .merge(s3_credentials)
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
  end
end
