module TwitterHelper

  def challenge_promotion_tweet(athlete_profile_id)
    athlete = AthleteProfile.find(athlete_profile_id)
    user = athlete.user.full_name
    school = athlete.school_name
    sport = athlete.athlete_experiences.first.sport
    long_url = "https://www.backyardlion.com/athlete_profiles/#{athlete_profile_id}"
    bitly = Bitly.client.shorten(long_url).short_url

=begin
    if athlete.twitter_url.blank?
      message = tweet_collection_no_twitter(user, school, sport, bitly)
      unless message.length > 139
        $client.update(message)
      end
    else
      if athlete.twitter_url.include?("@")
        twitter_url = athlete.twitter_url
      else
        twitter_url = athlete.twitter_url.prepend("@")
      end
      message = tweet_collection_has_twitter(twitter_url, user, school, sport, bitly, athlete)
      unless message.length > 139
        $client.update(message)
      end
    end
=end
  end

  def challenge_promotion_facebook(athlete_profile_id)
    athlete = AthleteProfile.find(athlete_profile_id)
    user = athlete.user.full_name
    school = athlete.school_name
    sport = athlete.athlete_experiences.first.sport
    long_url = "https://www.backyardlion.com/athlete_profiles/#{athlete_profile_id}"
    bitly = Bitly.client.shorten(long_url).short_url
=begin

    if athlete.facebook_url.blank?
      fb_message = fb_collection_no_fb(user, school, sport, bitly)

      $graph.put_connections("me", "feed", message: fb_message)
    else
      fb_message = fb_collection_has_fb(user, school, sport, bitly, athlete)
      $graph.put_connections("me", "feed", message: fb_message)
    end
=end
  end

  def tweet_collection_has_twitter(twitter_url, user, school, sport, bitly, athlete)
    ["We like > #{user} from #{school} > #{sport} Lion 'em > #{bitly} #{twitter_url}",
     "#{user} from #{school} > props for #{sport} from Backyard Lion > #{bitly} #{twitter_url}",
     "Checkout for #{user} from #{school} > a natural #{sport} player!  > #{bitly} #{twitter_url}",
     "#{user} from #{school} > respect > #{sport} via Backyard Lion > #{bitly} #{twitter_url}",
     "Raving over #{user} in #{sport} > Bright future > #{school} prospect #{bitly} #{twitter_url}",
     "Celebrate > #{user} in #{sport} from #{school}. #Gifted > Lion 'em #{bitly} #{twitter_url}",
     "#{user} from #{school} > thumbs up for #{sport} via Backyard Lion > #{bitly} #{twitter_url}",
     "We like #{user}'s #{sport} skills. Bright future > #{school} prospect #{bitly} #{twitter_url}",
     "Watching #{school} #{sport} > solid results from #{user}. Lion 'em #{bitly} #{twitter_url}",
     "Acknowledge > #{user} from #{school} > #{sport} > #Talented > Lion 'em #{bitly} #{twitter_url}",
     "#{user} from #{school} > good looking > #{sport} prospect > Lion 'em #{bitly} #{twitter_url}",
     "Big SHOUT-OUT > #{user} from #{school} > #{sport} > Lion 'em #{bitly} #{twitter_url}",
     "Props to #{sport} prospect > #{user} from #{school}. Lion 'em #{bitly} #{twitter_url}",
     "Respect > #{user} in #{sport} from #{school}. #StandOUT > Lion 'em #{bitly} #{twitter_url}",
     "Looking for a #{sport}er? We like #{user} from #{school} > Lion 'em #{bitly} #{twitter_url}",
     "Liking #{user}'s #{sport} skillz. > #{school} prospect #{bitly} #{twitter_url}",
     "S/O to #{user} of #{school} > SOLID #{sport} prospect> Lion 'em #{bitly} #{twitter_url}",
     "Results > #{user} from #{school} > #{sport}. Lion 'em #{bitly} #{twitter_url}",
     "Talent is talent & we like #{user}'s talent. Lion 'em > #{sport} prospect #{bitly} #{twitter_url}",
     "#{sport} prospect, #{user}, from #{school} is promising. Lion 'em #{bitly} #{twitter_url}",
     "BYL celebrates #{sport} prospect #{user} from #{school}. Lion 'em > #{bitly} #{twitter_url}",
     "Watch-out for #{user} in #{sport}. Thumbs up for the #{school} prospect #{bitly} #{twitter_url}",
     "Awesome #{sport} ATH from #{school}, #{user}. Lion 'em #{bitly} #{twitter_url}",
     "Checkout #{sport} prospect > #{user} > #{school}. Lion 'em #{bitly} #{twitter_url}",
     "Watch #{sport} athlete #{user} from #{school} #Talented > Lion 'em #{bitly} #{twitter_url}",
     "BYL likes #{user} > #{sport} from #{school}. Lion 'em > #{bitly} #{twitter_url}",
     "Skills are skills & we like #{user}'s skills > #{sport} prospect #{bitly} #{twitter_url}",
     "Backyard Lion loves what they see in #{user} from #{school}. Lion 'em #{bitly} #{twitter_url}"].sample
  end



  def tweet_collection_no_twitter(user, school, sport, bitly)
    ["We like > #{user} from #{school} > #{sport} Lion 'em > #{bitly}",
     "#{user} from #{school} > props for #{sport} from Backyard Lion > #{bitly}",
     "Checkout for #{user} from #{school} > a natural #{sport} player!  > #{bitly}",
     "#{user} from #{school} > respect > #{sport} via Backyard Lion > #{bitly}",
     "Raving over #{user} in #{sport} > Bright future > #{school} prospect #{bitly}",
     "Celebrate > #{user} in #{sport} from #{school}. #Gifted > Lion 'em #{bitly}",
     "#{user} from #{school} > thumbs up for #{sport} via Backyard Lion > #{bitly}",
     "We like #{user}'s #{sport} skills. Bright future > #{school} prospect #{bitly}",
     "Watching #{school} #{sport} > solid results from #{user}. Lion 'em #{bitly}",
     "Acknowledge > #{user} from #{school} > #{sport} > #Talented > Lion 'em #{bitly}",
     "#{user} from #{school} > good looking > #{sport} prospect > Lion 'em #{bitly}",
     "Big SHOUT-OUT > #{user} from #{school} > #{sport} > Lion 'em #{bitly}",
     "Props to #{sport} prospect > #{user} from #{school}. Lion 'em #{bitly}",
     "Respect > #{user} in #{sport} from #{school}. #StandOUT > Lion 'em #{bitly}",
     "Looking for a #{sport}er? We like #{user} from #{school} > Lion 'em #{bitly}",
     "Liking #{user}'s #{sport} skillz. > #{school} prospect #{bitly}",
     "S/O to #{user} of #{school} > SOLID #{sport} prospect> Lion 'em #{bitly}",
     "Results > #{user} from #{school} > #{sport}. Lion 'em #{bitly}",
     "Talent is talent & we like #{user}'s talent. Lion 'em > #{sport} prospect #{bitly}",
     "#{sport} prospect, #{user}, from #{school} is promising. Lion 'em #{bitly}",
     "BYL celebrates #{sport} prospect #{user} from #{school}. Lion 'em > #{bitly}",
     "Watch-out for #{user} in #{sport}. Thumbs up for the #{school} prospect #{bitly}",
     "Awesome #{sport} ATH from #{school}, #{user}. Lion 'em #{bitly}",
     "Checkout #{sport} prospect > #{user} > #{school}. Lion 'em #{bitly}",
     "Watch #{sport} athlete #{user} from #{school} #Talented > Lion 'em #{bitly}",
     "BYL likes #{user} > #{sport} from #{school}. Lion 'em > #{bitly}",
     "Skills are skills & we like #{user}'s skills > #{sport} prospect #{bitly}",
     "Backyard Lion loves what they see in #{user} from #{school}. Lion 'em #{bitly}"].sample
  end

  def fb_collection_has_fb(user, school, sport, bitly, athlete)
    ["We like > #{user} from #{school} > #{sport} Lion 'em > #{bitly} #{athlete.facebook_url}",
     "#{user} from #{school} > props for #{sport} from Backyard Lion > #{bitly} #{athlete.facebook_url}",
     "Checkout for #{user} from #{school} > a natural #{sport} player!  > #{bitly} #{athlete.facebook_url}",
     "#{user} from #{school} > respect > #{sport} via Backyard Lion > #{bitly} #{athlete.facebook_url}",
     "Raving over #{user} in #{sport} > Bright future > #{school} prospect #{bitly} #{athlete.facebook_url}",
     "Celebrate > #{user} in #{sport} from #{school}. #Gifted > Lion 'em #{bitly} #{athlete.facebook_url}",
     "#{user} from #{school} > thumbs up for #{sport} via Backyard Lion > #{bitly} #{athlete.facebook_url}",
     "We like #{user}'s #{sport} skills. Bright future > #{school} prospect #{bitly} #{athlete.facebook_url}",
     "Watching #{school} #{sport} > solid results from #{user}. Lion 'em #{bitly} #{athlete.facebook_url}",
     "Acknowledge > #{user} from #{school} > #{sport} > #Talented > Lion 'em #{bitly} #{athlete.facebook_url}",
     "#{user} from #{school} > good looking > #{sport} prospect > Lion 'em #{bitly} #{athlete.facebook_url}",
     "Big SHOUT-OUT > #{user} from #{school} > #{sport} > Lion 'em #{bitly} #{athlete.facebook_url}",
     "Props to #{sport} prospect > #{user} from #{school}. Lion 'em #{bitly} #{athlete.facebook_url}",
     "Respect > #{user} in #{sport} from #{school}. #StandOUT > Lion 'em #{bitly} #{athlete.facebook_url}",
     "Looking for a #{sport}er? We like #{user} from #{school} > Lion 'em #{bitly} #{athlete.facebook_url}",
     "Liking #{user}'s #{sport} skillz. > #{school} prospect #{bitly} #{athlete.facebook_url}",
     "S/O to #{user} of #{school} > SOLID #{sport} prospect> Lion 'em #{bitly} #{athlete.facebook_url}",
     "Results > #{user} from #{school} > #{sport}. Lion 'em #{bitly} #{athlete.facebook_url}",
     "Talent is talent & we like #{user}'s talent. Lion 'em > #{sport} prospect #{bitly} #{athlete.facebook_url}",
     "#{sport} prospect, #{user}, from #{school} is promising. Lion 'em #{bitly} #{athlete.facebook_url}",
     "BYL celebrates #{sport} prospect #{user} from #{school}. Lion 'em > #{bitly} #{athlete.facebook_url}",
     "Watch-out for #{user} in #{sport}. Thumbs up for the #{school} prospect #{bitly} #{athlete.facebook_url}",
     "Awesome #{sport} ATH from #{school}, #{user}. Lion 'em #{bitly} #{athlete.facebook_url}",
     "Checkout #{sport} prospect > #{user} > #{school}. Lion 'em #{bitly} #{athlete.facebook_url}",
     "Watch #{sport} athlete #{user} from #{school} #Talented > Lion 'em #{bitly} #{athlete.facebook_url}",
     "BYL likes #{user} > #{sport} from #{school}. Lion 'em > #{bitly} #{athlete.facebook_url}",
     "Skills are skills & we like #{user}'s skills > #{sport} prospect #{bitly} #{athlete.facebook_url}",
     "Backyard Lion loves what they see in #{user} from #{school}. Lion 'em #{bitly} #{athlete.facebook_url}"
    ].sample
  end

  def fb_collection_no_fb(user, school, sport, bitly) 
    ["We like > #{user} from #{school} > #{sport} Lion 'em > #{bitly}",
     "#{user} from #{school} > props for #{sport} from Backyard Lion > #{bitly}",
     "Checkout for #{user} from #{school} > a natural #{sport} player!  > #{bitly}",
     "#{user} from #{school} > respect > #{sport} via Backyard Lion > #{bitly}",
     "Raving over #{user} in #{sport} > Bright future > #{school} prospect #{bitly}",
     "Celebrate > #{user} in #{sport} from #{school}. #Gifted > Lion 'em #{bitly}",
     "#{user} from #{school} > thumbs up for #{sport} via Backyard Lion > #{bitly}",
     "We like #{user}'s #{sport} skills. Bright future > #{school} prospect #{bitly}",
     "Watching #{school} #{sport} > solid results from #{user}. Lion 'em #{bitly}",
     "Acknowledge > #{user} from #{school} > #{sport} > #Talented > Lion 'em #{bitly}",
     "#{user} from #{school} > good looking > #{sport} prospect > Lion 'em #{bitly}",
     "Big SHOUT-OUT > #{user} from #{school} > #{sport} > Lion 'em #{bitly}",
     "Props to #{sport} prospect > #{user} from #{school}. Lion 'em #{bitly}",
     "Respect > #{user} in #{sport} from #{school}. #StandOUT > Lion 'em #{bitly}",
     "Looking for a #{sport}er? We like #{user} from #{school} > Lion 'em #{bitly}",
     "Liking #{user}'s #{sport} skillz. > #{school} prospect #{bitly}",
     "S/O to #{user} of #{school} > SOLID #{sport} prospect> Lion 'em #{bitly}",
     "Results > #{user} from #{school} > #{sport}. Lion 'em #{bitly}",
     "Talent is talent & we like #{user}'s talent. Lion 'em > #{sport} prospect #{bitly}",
     "#{sport} prospect, #{user}, from #{school} is promising. Lion 'em #{bitly}",
     "BYL celebrates #{sport} prospect #{user} from #{school}. Lion 'em > #{bitly}",
     "Watch-out for #{user} in #{sport}. Thumbs up for the #{school} prospect #{bitly}",
     "Awesome #{sport} ATH from #{school}, #{user}. Lion 'em #{bitly}",
     "Checkout #{sport} prospect > #{user} > #{school}. Lion 'em #{bitly}",
     "Watch #{sport} athlete #{user} from #{school} #Talented > Lion 'em #{bitly}",
     "BYL likes #{user} > #{sport} from #{school}. Lion 'em > #{bitly}",
     "Skills are skills & we like #{user}'s skills > #{sport} prospect #{bitly}",
     "Backyard Lion loves what they see in #{user} from #{school}. Lion 'em #{bitly}"
    ].sample
  end
end