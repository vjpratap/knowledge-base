require 'pry'

class RegisterEmailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.register_email_mailer.welcome_email.subject
  #
  def welcome_email(user)

    @user = user
    mail to: user.email, subject: 'thanks for registering in Knowledge base'
  end
end
