require 'rails_helper'

RSpec.describe Activity, type: :model do
  context "validations" do
    [:activity_type, :associated_activity_id].each do |attr|
      it "validates presence of #{attr}" do
        expect(subject).to validate_presence_of(attr)
      end
    end
  end
end