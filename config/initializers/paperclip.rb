if Rails.env.production?
  Paperclip::Attachment.default_options[:storage] = :s3
  Paperclip::Attachment.default_options[:s3_credentials] = {
    bucket:            ENV["S3_BUCKET"],
    access_key_id:     ENV["S3_ACCESS_KEY_ID"],
    secret_access_key: ENV["S3_SECRET_ACCESS_KEY"]
  }
  Paperclip::Attachment.default_options[:s3_protocol] = "http"
  Paperclip::Attachment.default_options[:url]  = ":s3_alias_url"
  Paperclip::Attachment.default_options[:s3_host_alias] = ENV["CLOUDFRONT_URL"]
  Paperclip::Attachment.default_options[:path] = "/:class/:attachment/:id_partition/:updated_at/:style/:filename"
  # Environment variable would NOT work here, had to hardcode region
  Paperclip::Attachment.default_options[:s3_region] = "us-west-2"
  Paperclip::Attachment.default_options[:s3_permissions] = "public-read"
end