require "googleauth"
require "google/api_client"
require "google_drive"

namespace :backyard_lion do

  desc "Updates colleges table from Google spreadsheet"
  task update_colleges: :environment do
    spreadsheet_name = "byl_colleges"

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
      college = College.find_or_initialize_by(id: college_attrs[:id])
      if college.persisted?
        puts "Updating #{college.name}"
      else
        puts "Adding #{college_attrs[:name]}"
      end
      college.update!(college_attrs)
    end
  end

  desc "Updates college teams"
  task update_teams: :environment do
    spreadsheet_name = "byl_teams_update"
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
      team_attrs = attrs.zip(row).to_h
      team = Team.find_or_initialize_by(id: team_attrs[:id])
      if team.persisted?
        puts "Updating #{team.sport_name}"
      else
        puts "Adding #{team_attrs[:sport_name]}"
      end
      team.update!(team_attrs.reject {|k, _| k == :logo })
    end
  end
end