require "rails_helper"

RSpec.describe AthleteProfile, type: :model do
  context "validations" do
    [:gender, :country, :city, :state, :zipcode, :height_feet, :height_inches, :weight, :birthday, :school_name, :graduation_year, :primary_phone].each do |attr|
      it "validates presence of #{attr}" do
        expect(subject).to validate_presence_of(attr)
      end
    end
  end

  context "relationships" do
    it "belongs to a user" do
      expect(subject).to belong_to :user
    end

    it "has many athlete_requests" do
      expect(subject).to have_many :athlete_requests
    end

    it "has many athlete_experiences" do
      expect(subject).to have_many :athlete_experiences
    end

    it "has many coaches" do
      expect(subject).to have_many :coaches
    end

    it "has many athlete_awards" do
      expect(subject).to have_many :athlete_awards
    end

    it "has many athlete_recommendations" do
      expect(subject).to have_many :athlete_recommendations
    end

    it "has many skills" do
      expect(subject).to have_many :skills
    end

    it "has many interests" do
      expect(subject).to have_many :interests
    end

    it "has many teams" do
      expect(subject).to have_many :teams
    end

    it "has many saved_athletes" do
      expect(subject).to have_many :saved_athletes
    end

    it "has many users" do
      expect(subject).to have_many :users
    end

    it "has many athlete_profile_views" do
      expect(subject).to have_many :athlete_profile_views
    end

    it "has many teams" do
      expect(subject).to have_many :teams
    end

    it "has many followers" do
      expect(subject).to have_many :followers
    end

    it "has many endorsements" do
      expect(subject).to have_many :endorsements
    end

    it "has many athlete_notifications" do
      expect(subject).to have_many :athlete_notifications
    end

    it "has many factor_ratings" do
      expect(subject).to have_many :factor_ratings
    end

    it "has many factors" do
      expect(subject).to have_many :factors
    end

    it "has many state_ratings" do
      expect(subject).to have_many :state_ratings
    end

    it "has many states" do
      expect(subject).to have_many :states
    end

    it "has many region_ratings" do
      expect(subject).to have_many :region_ratings
    end

    it "has many regions" do
      expect(subject).to have_many :regions
    end
  end

  context "when an athlete profile is deleted" do
    before do
      @devan = FactoryGirl.create(:devan)
      @athlete_profile = FactoryGirl.create(:athlete_profile, user: @devan)
      @athlete_request = FactoryGirl.create(:athlete_request, athlete_profile_id: @athlete_profile.id)
      @coach = FactoryGirl.create(:coach, athlete_profile_id: @athlete_profile.id)
      @athlete_award = FactoryGirl.create(:athlete_award, athlete_profile_id: @athlete_profile.id)
      @athlete_recommendation = FactoryGirl.create(:athlete_recommendation, athlete_profile_id: @athlete_profile.id, recommendation_text: "She's great", giver_relationship: "Teammate")
      @interest = FactoryGirl.create(:interest, athlete_profile_id: @athlete_profile.id)
      @saved_athlete = FactoryGirl.create(:saved_athlete, athlete_profile_id: @athlete_profile.id)
      @skill = FactoryGirl.create(:skill, athlete_profile_id: @athlete_profile.id)
      @athlete_profile_view = FactoryGirl.create(:athlete_profile_view, athlete_profile_id: @athlete_profile.id)
      @endorsement = FactoryGirl.create(:endorsement, athlete_profile_id: @athlete_profile.id)
      @follower = FactoryGirl.create(:follower, athlete_profile_id: @athlete_profile.id)
      factor = FactoryGirl.create(:factor)
      factor_choice = FactoryGirl.create(:factor_choice, factor: factor)
      @athlete_profile.factor_ratings << FactoryGirl.create(:factor_rating, factor: factor, factor_choice: factor_choice)
      state = FactoryGirl.create(:state)
      state_preference = FactoryGirl.create(:state_preference, state: state)
      @athlete_profile.state_ratings << FactoryGirl.create(:state_rating, state: state, state_preference: state_preference)
      region = FactoryGirl.create(:region)
      region_preference = FactoryGirl.create(:region_preference, region: region)
      @athlete_profile.region_ratings << FactoryGirl.create(:region_rating, region: region, region_preference: region_preference)
    end

    it "deletes the user" do
      expect { @athlete_profile.destroy }.to change { User.count }.by(-1)
    end

    it "deletes the athlete requests" do
      expect { @athlete_profile.destroy }.to change { AthleteRequest.count }.by(-1)
    end

    it "deletes the coach" do
      expect { @athlete_profile.destroy }.to change { Coach.count }.by(-1)
    end

    it "deletes the athlete awards" do
      expect { @athlete_profile.destroy }.to change { AthleteAward.count }.by(-1)
    end

    it "deletes the athlete recommendations" do
      expect { @athlete_profile.destroy }.to change { AthleteRecommendation.count }.by(-1)
    end

    it "deletes the skills" do
      expect { @athlete_profile.destroy }.to change { Skill.count }.by(-1)
    end

    it "deletes the interests" do
      expect { @athlete_profile.destroy }.to change { Interest.count }.by(-1)
    end

    it "deletes the saved_athletes" do
      expect { @athlete_profile.destroy }.to change { SavedAthlete.count }.by(-1)
    end

    it "deletes the athlete_profile_views" do
      expect { @athlete_profile.destroy }.to change { AthleteProfileView.count }.by(-1)
    end

    it "deletes the followers" do
      expect { @athlete_profile.destroy }.to change { Follower.count }.by(-1)
    end

    it "deletes the endorsements" do
      expect { @athlete_profile.destroy }.to change { Endorsement.count }.by(-1)
    end

    it "deletes the factor ratings" do
      expect { @athlete_profile.destroy }.to change { FactorRating.count }.by(-1)
    end

    it "deletes the state ratings" do
      expect { @athlete_profile.destroy }.to change { StateRating.count }.by(-1)
    end

    it "deletes the region ratings" do
      expect { @athlete_profile.destroy }.to change { RegionRating.count }.by(-1)
    end
  end
end