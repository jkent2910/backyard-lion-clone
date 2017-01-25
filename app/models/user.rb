class User < ActiveRecord::Base

  TEMP_EMAIL_PREFIX = 'user'
  TEMP_EMAIL_REGEX = /\Auser/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  enum user_type: { athlete: 1, coach: 2, byl_admin: 3, college_admin: 4, supporter: 5 }

  validates_presence_of :first_name, :last_name, :email, :user_type, unless: -> { from_omniauth? }

  has_many :saved_athletes
  has_many :athlete_profiles, :through => :saved_athletes

  has_many :comments
  has_many :videos, :through => :comments

  #
  # validates :password, presence: true, on: :create
  # validates :password_confirmation, presence: true, on: :create

  has_one :athlete_profile

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  after_create :generate_token, :if => :user_coach?

  def generate_token
    self.update_column(:token, SecureRandom.hex.to_s)
  end

  def user_coach?
    self.coach?
  end


  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email = auth.info.email
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
            #username: auth.info.nickname || auth.uid,
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            first_name: auth.info.first_name,
            last_name: auth.info.last_name,
            password: Devise.friendly_token[0,20]
        )
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end

  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||',
                                    Arel::Nodes::InfixOperation.new('||',
                                                                    parent.table[:first_name], Arel::Nodes.build_quoted(' ')
                                    ),
                                    parent.table[:last_name]
    )
  end

  def saved_athlete?(athlete)
    athlete = SavedAthlete.find_by(user_id: self.id, athlete_profile_id: athlete.id)
    !athlete.nil?
  end

  def save_athlete(athlete)
    saved_athletes.create!(user_id: self, athlete_profile_id: athlete.id) unless saved_athlete?(athlete)
  end

  def unsave_athlete(athlete)
    athlete = saved_athletes.where("user_id = ? AND athlete_profile_id =?", self.id, athlete.id)
    athlete.destroy_all
  end

  def liked_activity?(activity)
    activity = ActivityLike.find_by(liker_id: self.id, activity_id: activity.id)
    !activity.nil?
  end

  def like_activity(activity)
    like = ActivityLike.create!(liker_id: self.id, activity_id: activity.id) unless liked_activity?(activity)
    unless AthleteNotification.where('athlete_profile_id = ? AND notification_id = ? AND notification_type = ?', activity.athlete_profile_id, like.id, "activity_like").any?
      AthleteNotification.create!(notification_type: "activity_like", notification_id: like.id, athlete_profile_id: activity.athlete_profile_id)
    end
  end

  def unlike_activity(activity)
    likes = ActivityLike.where("liker_id = ? AND activity_id =?", self.id, activity.id)
    likes.destroy_all
  end

  private

  def from_omniauth?
    !Identity.find_by(user_id: self.id).nil?
  end
end
