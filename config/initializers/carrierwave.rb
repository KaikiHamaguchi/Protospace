CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.aws_access_key,
    aws_secret_access_key: Settings.aws_secret_access_key,
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
        config.storage = :fog
        config.fog_directory  = 'techcamp'
        config.asset_host = 'https://s3.amazonaws.com/techcamp'
    when 'production'
        config.storage = :fog
        config.fog_directory  = 'techcamp'
        config.asset_host = 'https://s3.amazonaws.com/techcamp'
    when 'test'
        config.storage = :file
        config.fog_directory  = 'techcamp'
        config.asset_host = 'https://s3.amazonaws.com/techcamp'
    end
end
