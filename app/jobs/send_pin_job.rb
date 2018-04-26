class SendPinJob < ApplicationJob
  queue_as :default

  def perform(user)
    client = Nexmo::Client.new(api_key: ENV["NEXMO_KEY"], api_secret: ENV["NEXMO_SECRET"])
    resp = client.sms.send(from: "Tap4", to: user.phone, text: user.pin)
  end
end
