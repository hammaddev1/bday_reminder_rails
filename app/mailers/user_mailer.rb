class UserMailer < ApplicationMailer
  default from: ENV["email_from"]

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: ENV["email_subject"])
  end
end
