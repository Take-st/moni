require 'bundler/setup'
require 'net/http'
require 'uri'
require 'json'
require 'slack-ruby-client'

class PostToSlack
  def execute(image_path)
    Slack.configure do |config|
      config.token = ENV['MONI_SLACK_TOKEN']
    end

    client = Slack::Web::Client.new
    channel = '#monimonimoni'
    text = 'Hello World'

    client.files_upload(
      channels: channel,
      file: Faraday::UploadIO.new(image_path, 'image/png'),
      title: 'My Avatar',
      filename: 'hoge.jpg',
      initial_comment: 'Attached a selfie.'
    )
  end
end



# uri  = URI.parse()
# FILES_UPLOAD_URL = "https://slack.com/api/files.upload"
# TOKEN = 
# CHANNEL_ID = "CHKEFPNDD"

# uri  = URI.parse(FILES_UPLOAD_URL)

# params = {
#   token: TOKEN,
#   channels: CHANNEL_ID,
#   text: 'from ruby'
# }

# http = Net::HTTP.new(uri.host, uri.port)
# http.use_ssl = true
# http.start do
#   request = Net::HTTP::Post.new(uri.path)
#   request.set_form_data(payload: params.to_json)
#   @res = http.request(request)
# end


# puts @res
