CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }

  config.fog_directory = 'mh3bucket'
  config.fog_public = false
  config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
end
