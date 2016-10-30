CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    aws_access_key_id: Settings[:protospace][:Access_Key_Id],
    aws_secret_access_key: Settings[:protospace][:Secret_Access_Key],
    provider: 'AWS',
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'upload-ikeda'
        config.asset_host = 'https://s3.amazonaws.com/upload-ikeda'
    when 'production'
        config.fog_directory  = 'upload-ikeda'
        config.asset_host = 'https://s3.amazonaws.com/upload-ikeda'
    end
end