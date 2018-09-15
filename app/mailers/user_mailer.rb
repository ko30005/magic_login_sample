# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.magic_login_email.subject
  #
  def magic_login_email(user)
    @url = magic_tokens_verify_url(token: user.magic_login_token)
    @greeting = 'Hi'

    mail to: user.email
  end
end
