module MailerHelper 
require 'sendgrid-ruby'
include SendGrid
def send_email(user_email_address)
  from = SendGrid::Email.new(email: ENV["email_from"])
  to = SendGrid::Email.new(email: user_email_address)
  subject = ENV["email_subject"]
  content = SendGrid::Content.new(type: 'text/plain', value: 'Welcome to the bday_reminder community')
  mail = SendGrid::Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)

  end
end