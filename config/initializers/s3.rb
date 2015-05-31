# CarrierWave.configure do |config|
#   config.cache_dir = "#{Rails.root}/tmp/" 
#   config.permissions = 0666
#   config.storage = :fog
#   config.fog_credentials = {
#     :provider               => 'AWS',
#     :aws_access_key_id      => "AKIAJKVDPTTS223FN6ZQ",
#     :aws_secret_access_key  => "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",
#     :region  => 'us-east-1'
#   }
#   config.fog_directory  = "jalaon"                             # required
#   # config.fog_host     = 'https://assets.example.com'             # optional, defaults to nil
#   # config.fog_public     = false                                  # optional, defaults to true
#   # config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}  # optional, defaults to {}
# end


CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
    :aws_access_key_id      => "AKIAJKVDPTTS223FN6ZQ",
    :aws_secret_access_key  => "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",
      # :region                 => ENV['S3_REGION'] # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "jalaon" 
end