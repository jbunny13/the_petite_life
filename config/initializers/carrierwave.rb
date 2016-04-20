CarrierWave.configure do |config|
  if Rails.env.production?
    # required
    config.fog_provider = 'fog/aws'                        
    config.fog_credentials = {
      # required
      provider:              'AWS',
      # required
      aws_access_key_id:     ENV["S3_ACCESS_KEY_ID"],
      # required
      aws_secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
      # optional, defaults to 'us-east-1'
      region:                'us-west-2',
      # optional, defaults to nil
      # host:                  'tplcdn.thepetitelife.com',
      # optional, defaults to nil
      # endpoint:              'https://tplcdn.thepetitelife.com.s3.amazonaws.com'
    }
    # required
    config.fog_directory  = ENV["S3_BUCKET"]
    # optional, defaults to true
    # config.fog_public     = false
    # optional, defaults to {}
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  else
    config.storage = :file
  end
end