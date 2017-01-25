require "googleauth"
require "google/api_client"
require "google_drive"

namespace :backyard_lion do

  desc "Creates CollegeCoach records from Google spreadsheet"
  task create_college_coach_records: :environment do
    spreadsheet_name = "byl_coaches"

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

    worksheet.rows.drop(1).each do |row|
      college_attrs = attrs.zip(row).to_h
      p college_attrs
      # Try to find college
      college = College.find_by(name: college_attrs[:college])
      if college.nil?
        puts "Couldn't find a college with name #{college_attrs[:college]}"
      else
        # Try to find team
        team = Team.find_by(college_id: college.id, sport_name: college_attrs[:sport])
        if team.nil?
          puts "Couldn't find a team with college_id #{college.id} or team with sport_name #{college_attrs[:sport]}"
        else
          coach = CoachContact.create!(college_id: college.id, college_name: college_attrs[:college], team_id: team.id, sport: college_attrs[:sport],
                              first_name: college_attrs[:first_name], last_name: college_attrs[:last_name], position: college_attrs[:position],
                              email: college_attrs[:email], phone: college_attrs[:phone])

          puts "Created coach contact for #{college_attrs[:college]} team #{college_attrs[:sport]}"
        end
      end
    end
  end
end