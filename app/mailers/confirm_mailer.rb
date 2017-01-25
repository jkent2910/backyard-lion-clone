class ConfirmMailer < ActionMailer::Base

  default from: 'devan.moylan@backyardlion.com'

  def confirm_mailer(token, college_email, user, social_media)
    @token = token
    @email = college_email
    @user = user
    @social_media = social_media

    to_emails = @email

    mail(:to => to_emails,
         :subject => "Please confirm your Backyard Lion account")
  end
end