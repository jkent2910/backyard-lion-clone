require 'rails_helper'

RSpec.describe AthleteNotification, type: :model do
  context "validations" do
    [:athlete_profile_id, :notification_type, :notification_id].each do |attr|
      it "validates presence of #{attr}" do
        expect(subject).to validate_presence_of(attr)
      end
    end
  end

  context "relationships" do
    it "belongs to athlete_profiles" do
      expect(subject).to belong_to :athlete_profile
    end
  end
end