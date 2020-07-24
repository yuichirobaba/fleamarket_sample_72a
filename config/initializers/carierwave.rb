# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# CarrierWave.configure do |config|
#   config.storage = :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#     provider: 'AWS',
#     aws_access_key_id: Rails.application.secrets.aws_access_key_id,
#     regin: 'ap-northeast-1'
#   }

#   config.fog_directory = 'ここにバケット名を入れます'
#   config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/ここにバケット名を入れます'