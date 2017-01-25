require "googleauth"
require "google/api_client"
require "google_drive"

namespace :backyard_lion do

  desc "Invite athletes via twilio"
  task twilio_invites: :environment do
    spreadsheet_name = "twilio_invite"

    ENV["GOOGLE_APPLICATION_CREDENTIALS"] = Rails.root.join("config", "google_college_credentials.json").to_path
    ENV["SSL_CERT_FILE"] = $LOAD_PATH.grep(/google-api-client/).first + "/cacerts.pem"

    credentials = Google::Auth.get_application_default
    credentials.scope = ["https://www.googleapis.com/auth/drive", "https://spreadsheets.google.com/feeds/"]
    credentials.fetch_access_token!
    access_token = credentials.access_token

    drive_session = GoogleDrive.login_with_oauth(access_token)

    spreadsheet = drive_session.spreadsheet_by_title(spreadsheet_name)
    raise "Spreadsheet #{spreadsheet_name} not found" unless spreadsheet

    worksheet = spreadsheet.worksheets.first

    attrs = worksheet.rows.first.map(&:to_sym)

    @client = Twilio::REST::Client.new

    bitly_url = "http://bit.ly/2ghsjGG"

    worksheet.rows.drop(1).each do |row|
      athlete_attrs = attrs.zip(row).to_h
      p athlete_attrs

      if athlete_attrs[:phone_number] != ""
        number = athlete_attrs[:phone_number].gsub(/([-() ])/, '')
        new_number = number.prepend("1")

        if athlete_attrs[:high_school] != ""
          @client.messages.create(
              from: "13197748150",
              to: new_number,
              body: "Hi #{athlete_attrs[:first_name]}! You've been invited by someone at #{athlete_attrs[:high_school]} to join Backyard Lion for your outstanding performance at #{athlete_attrs[:sport]} -- Create a profile for 100% free so you can start connecting with college coaches.  Join now: #{bitly_url}"
          )
        else
          @client.messages.create(
              from: "13197748150",
              to: new_number,
              body: "Hi #{athlete_attrs[:first_name]}! You've been invited to join Backyard Lion for your outstanding performance at #{athlete_attrs[:sport]} -- Create a profile for 100% free so you can start connecting with college coaches.  Join now: #{bitly_url}"
          )
        end

      end
    end
  end
end