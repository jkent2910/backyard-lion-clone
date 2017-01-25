require "rails_helper"

RSpec.describe AthleteExperience, type: :model do
  context "validations" do
    [:sport, :level].each do |attr|
      it "validates presence of #{attr}" do
        expect(subject).to validate_presence_of(attr)
      end
    end
  end

  context "relationships" do
    it "belongs to athlete_profiles" do
      expect(subject).to belong_to :athlete_profile
    end

    it "has many athlete_recommendations" do
      expect(subject).to have_many :athlete_recommendations
    end

    it "has many videos" do
      expect(subject).to have_many :videos
    end

    it "has many statistics" do
      expect(subject).to have_many :statistics
    end

    it "has many athlete_ratings" do
      expect(subject).to have_many :athlete_ratings
    end
  end

  context "before destroy" do
    it "deletes related videos" do
      experience = FactoryGirl.create(:athlete_experience)
      video = FactoryGirl.create(:video, athlete_experience_id: experience.id)

      expect{ experience.destroy }.to change(Video, :count).by(-1)
    end

    it "deletes related activities" do
      experience = FactoryGirl.create(:athlete_experience)
      video = FactoryGirl.create(:video, athlete_experience_id: experience.id)

      expect{ experience.destroy }.to change(Activity, :count).by(-1)
    end
  end
end