require "googleauth"
require "google/api_client"
require "google_drive"

namespace :backyard_lion do

  desc "Send coach feedback emails Google spreadsheet"
  task send_coach_feedback_emails: :environment do
    spreadsheet_name = "coach_feedback_emails"

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

      unless invite_attrs[:email].blank?
        InviteMailer.coach_feedback(invite_attrs[:email], invite_attrs[:first_name], invite_attrs[:position], invite_attrs[:last_name], invite_attrs[:sport], invite_attrs[:college]).deliver_later
      end

    end
  end
end