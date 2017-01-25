FactoryGirl.define do
  factory :endorsement_invite do
    email "MyString"
    invited_by_user_id 1
    invite_sent_count 1
  end
end
