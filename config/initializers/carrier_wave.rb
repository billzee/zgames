require 'carrierwave/orm/activerecord'
require 'carrierwave/storage/fog'

dir = Rails.root.join('lib', 'carrierwave_processing')
$LOAD_PATH.unshift(dir)
Dir[File.join(dir, "*.rb")].each { |file| require File.basename(file) }

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'                        # required
    config.fog_public = true

    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['S3_KEY'],                # required
      aws_secret_access_key: ENV['S3_SECRET'],             # required
      region:                'sa-east-1'                   # optional, defaults to 'us-east-1'
    }

    config.fog_directory  = ENV['S3_BUCKET_NAME']                          # required
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}
  else
    config.storage = :file
  end
end
