class AthleteProfile < ActiveRecord::Base

  belongs_to :user, dependent: :destroy

  has_many :athlete_requests, dependent: :destroy

  has_many :athlete_photos, :dependent => :destroy

  has_many :athlete_experiences, dependent: :destroy
  accepts_nested_attributes_for :athlete_experiences, reject_if: :all_blank, allow_destroy: true

  has_many :coaches, dependent: :destroy
  accepts_nested_attributes_for :coaches, reject_if: :all_blank, allow_destroy: true

  has_many :athlete_awards, dependent: :destroy
  accepts_nested_attributes_for :athlete_awards, reject_if: :all_blank, allow_destroy: true

  has_many :athlete_recommendations, dependent: :destroy

  has_many :skills, dependent: :destroy
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true

  has_many :interests, dependent: :destroy
  has_many :teams, :through => :interests

  has_many :saved_athletes, dependent: :destroy
  has_many :users, :through => :saved_athletes

  has_many :followers, dependent: :destroy
  has_many :teams, :through => :followers

  has_many :endorsements, dependent: :destroy

  has_many :athlete_notifications, dependent: :destroy

  has_many :factor_ratings, -> { joins(:factor) }, dependent: :destroy
  has_many :factors, through: :factor_ratings
  accepts_nested_attributes_for :factor_ratings

  has_many :state_ratings, -> { joins(:state) }, dependent: :destroy
  has_many :states, through: :state_ratings
  accepts_nested_attributes_for :state_ratings

  has_many :region_ratings, -> { joins(:region) }, dependent: :destroy
  has_many :regions, through: :region_ratings
  accepts_nested_attributes_for :region_ratings

  has_many :characteristic_answers, -> { joins(:characteristic) }, dependent: :destroy
  accepts_nested_attributes_for :characteristic_answers

  enum gender: { female: 1, male: 2 }
  enum contact_info_privacy: { contact_info_public: 1, contact_info_college: 2, contact_info_private: 3 }
  enum academic_info_privacy: { academic_info_public: 1, academic_info_college: 2, academic_info_private: 3 }

  has_attached_file :profile_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\Z/

  validates :gender, :country, :city, :state, :zipcode, :height_feet, :height_inches, :weight, :birthday, :school_name, :graduation_year, presence: true

  validate :require_one_experience

  geocoded_by :zipcode
  after_validation :geocode, :if => :zipcode_changed?
  after_validation :geocode

  def invite_contacts(contacts_array)
    email_contacts = []
    phone_contacts = []
    unless contacts_array.empty?
      contacts_array.each do |c|
        unless c.nil?
          if c.include? "@"
            email_contacts << c
          else
            phone_contacts << c
          end
        end
      end

      user = User.find(self.user_id).full_name
      user_email = User.find(self.user_id).email

      long_url = "https://www.backyardlion.com/?invited_by=#{user}"
      bitly_url = Bitly.client.shorten(long_url).short_url

      email_contacts.each do |e|
        InvitedContact.create(email: e, invited_by_user_id: self.user_id, invite_sent_count: 1)
        InviteMailer.athlete_invite_mailer(user, e, self.school_name, bitly_url, user_email).deliver_later
      end

      @client = Twilio::REST::Client.new

      phone_contacts.each do |p|
        number = p.gsub(/([-() ])/, '')
        new_number = number.prepend("1")
        @client.messages.create(
            from: "13197748150",
            to: new_number,
            body: "#{user} has invited you to join Backyard Lion -- Create a profile for 100% free so you can start connecting with college coaches.  Join now: #{bitly_url}"
        )
      end

      email_num = email_contacts.length
      phone_num = phone_contacts.length
      contacts_invited = email_num + phone_num

      if self.contacts_invited.nil?
        new_num_contacts = contacts_invited
        self.update_attributes(contacts_invited: new_num_contacts)
      else
        new_num_contacts = self.contacts_invited + contacts_invited
        self.update_attributes(contacts_invited: new_num_contacts)
      end
    end


  end


  def require_one_experience
    errors.add(:athlete_experience, "You must provide at least one experience") if athlete_experiences.size < 1
  end

  def endorsed_skill?(skill, endorser)
    endorsement = Endorsement.find_by(endorser_id: endorser, skill_id: skill)
    !endorsement.nil?
  end

  def expressed_interest?(team)
    interest = Interest.find_by(team_id: team, athlete_profile_id: self.id)
    !interest.nil?
  end

  def express_interest(team, user_id)
    interests.create!(team_id: team, athlete_profile_id: self) unless expressed_interest?(team)

    if CoachContact.where(team_id: team).exists?
      contact = CoachContact.where(team_id: team)
      contact.each do |c|
        NotificationMailer.express_interest_team(c.email, c.team_id, c.first_name).deliver_later
      end
    end

    # Create notification for team
    unless TeamNotification.where('team_id = ? AND other_user_id = ? AND notification_type = ?', team, user_id, 2).any?
      TeamNotification.create!(team_id: team, notification_type: "athlete_interest", other_user_id: user_id)
    end
  end


  def remove_interest(team)
    interest = interests.where("team_id = ? AND athlete_profile_id = ?", team.id, self.id)
    interest.destroy_all
  end

  def remove_skill_endorsement(skill, endorser)
    remove_endorsements = endorsements.where('endorser_id = ? AND skill_id = ?', endorser.id, skill.id)
    remove_endorsements.each do |e|
      notification = AthleteNotification.where('notification_type = ? AND notification_id = ?', "skill_endorsement", e.id)
      notification.destroy_all
    end

    remove_endorsements.destroy_all
  end

  def endorse_skill(skill, endorser, type)
    endorsements.create!(athlete_profile_id: self, skill_id: skill.id, endorser_id: endorser.id, user_type: type) unless endorsed_skill?(skill, endorser)
    athlete_notifications.create!(athlete_profile_id: self, notification_type: "skill_endorsement", notification_id: endorsements.last.id)
    NotificationMailer.skill_notification(self.id).deliver_later
  end

  def followed_team?(team)
    teams.include? team
  end

  def follow_team(team)
    followers.create!(team_id: team.id, athlete_profile_id: self) unless followed_team?(team)
  end

  def unfollow_team(team)
    teams.delete(team)
  end

  def format_height
    "#{height_feet.to_i}'#{height_inches.to_i}".strip
  end

end
