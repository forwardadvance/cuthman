module HasImage

  def self.included(klass)
    klass.extend ClassMethods
    klass.add_attachments
  end

  def image_upload_url=(url)
    self.image = URI.parse(url)
  end

  def banner_upload_url=(url)
    self.banner = URI.parse(url)
  end

  module ClassMethods
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
          },
          :url =>':s3_domain_url',
          :path => '/:class/:attachment/:id_partition/:style/:filename'
        }
      end
    end

    def add_attachments
      self.has_attached_file :image, image_styles
        .merge(default_url: "/images/:style/missing.png")
        .merge(s3_credentials)
      self.has_attached_file :banner, banner_styles
        .merge(default_url: "/images/:style/missing_banner.png")
        .merge(s3_credentials)
      self.validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
      self.validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
    end
  end
end
