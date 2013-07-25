class UserMailer < ActionMailer::Base
  default from: "testapp454@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email, :subject => "Your password has been reset")
  end

  def welcome(user)
    @user = user
    mail(:to => user.email, :subject => "Thank you for subscribing!")
  end
end
