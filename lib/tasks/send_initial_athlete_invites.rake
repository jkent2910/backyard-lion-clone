require "googleauth"
require "google/api_client"
require "google_drive"

namespace :backyard_lion do

  desc "Sends athlete invites from Google spreadsheet"
  task send_invites: :environment do
    spreadsheet_name = "email_athlete_invites"

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
      invite_attrs = attrs.zip(row).to_h
      new_athlete = NewAthleteInvite.create(first_name: invite_attrs[:first_name],
                              email: invite_attrs[:email],
                              grad_year: invite_attrs[:grad_year],
                              state: invite_attrs[:state],
                              sport: invite_attrs[:sport],
                              high_school: invite_attrs[:high_school],
                              invite_count: 1,
                              last_invite_sent: Date.today)


      InviteMailer.new_invite_email(new_athlete).deliver_later

    end
  end
end