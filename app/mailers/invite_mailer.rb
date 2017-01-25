class InviteMailer < ActionMailer::Base
  default from: 'devan.moylan@backyardlion.com'

  def invite_mailer(admin_email, first_name, last_name, college, email)
    @admin_email = admin_email
    @first_name = first_name
    @last_name = last_name
    @college = college
    @email = email
    to_emails = @email

    mail(:to => to_emails,
        :subject => "#{admin_email} wants to connnect with you on Backyard Lion")
  end

  def athlete_invite_mailer(user, email, highschool, bitly, from_email)
    to_emails = email
    @email = email
    @user = user
    @bitly = bitly
    @highschool = highschool
    @from_email = from_email

    mail(:to => to_emails,
         :subject =>"I'd like to connect with you on Backyard Lion",
         :from => @from_email)
  end

  def gmail_invite_mailer(email, invited_user_name, user_first_name, user_email, bitly)
    to_emails = email
    @invited_user_name = invited_user_name
    @bitly = bitly
    @user_email = user_email
    @user_first_name = user_first_name

    mail(:to => to_emails,
         :subject =>"I thought you might like this....",
         :from => @user_email)
  end

  def athlete_coach_mailer(email, user, bitly_url)
    to_emails = email
    @bitly = bitly_url
    @user_email = user.email
    @email = email
    @full_name = user.full_name

    mail(:to => to_emails,
         :subject => "Coach, can you give me a recommendation?",
         :from => @user_email)
  end

  def athlete_endorsement_mailer(email, user, bitly_url)
    to_emails = email
    @bitly = bitly_url
    @user_email = user.email
    @email = email
    @full_name = user.full_name

    mail(:to => to_emails,
         :subject => "Can you endorse me on Backyard Lion?",
         :from => @user_email)
  end

  def new_invite_mailer(athlete)
    to_emails = athlete.email
    @first_name = athlete.first_name
    @high_school = athlete.high_school

    mail(:to => to_emails,
         :subject => "#{@first_name} is invited: 1 invitation",
         :from => "devan@backyardlion.com")

  end

  def follow_up_email(athlete)
    to_emails = athlete.email
    @first_name = athlete.first_name
    @high_school = athlete.high_school

    mail(:to => to_emails,
         :subject => "#{@first_name} is invited: 1 invitation",
         :from => "devan@backyardlion.com")
  end

  def coach_feedback(email, first_name, position, last_name, sport, college)
    @email = email
    @first_name = first_name
    @last_name = last_name
    @position = position
    @sport = sport
    @college = college

    mail(:to => @email,
         :subject => "Seeking advice on #{@sport}",
         :from => "moylan@backyardlion.com")

  end

  def julie_coach_feedback(email, first_name, position, last_name, sport, college)
    @email = email
    @first_name = first_name
    @last_name = last_name
    @position = position
    @sport = sport
    @college = college

    mail(:to => @email,
         :subject => "Seeking advice on #{@sport}",
         :from => "julie.kent@backyardlion.com")

  end
end