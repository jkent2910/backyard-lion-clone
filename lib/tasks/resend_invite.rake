namespace :backyard_lion do
  desc "Resend invite to invited contacts who haven't signed up"
  task resend_invite: :environment do

    # Get all invited contacts
    InvitedContact.all.each do |c|
      if User.where(email: c.email).empty?

        if c.invite_sent_count < 5
          user = User.find(c.invited_by_user_id).full_name
          long_url = "https://www.backyardlion.com/?invited_by=#{user}"
          bitly_url = Bitly.client.shorten(long_url).short_url
          InviteMailer.athlete_invite_mailer(user, c.email, bitly_url).deliver_later
          old_count = c.invite_sent_count
          c.update_attributes(invite_sent_count: old_count + 1)
        end
      end
    end
  end
end

