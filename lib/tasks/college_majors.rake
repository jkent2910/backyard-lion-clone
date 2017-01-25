require "googleauth"
require "google/api_client"
require "google_drive"

namespace :backyard_lion do

  desc "Updates colleges table from Google spreadsheet"
  task update_college_majors: :environment do
    spreadsheet_name = "majors_updated"

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
      college = College.find_or_initialize_by(name: college_attrs[:name])
      if college.persisted?

      popular_majors_array = college_attrs[:popular_majors].split(",")
      popular_majors_array.each do |major|
        remove_whitespaces = major.strip
        pop_major = CollegeMajor.create(name: remove_whitespaces, college_id: college.id, most_popular: true)
        puts "Creating #{pop_major.name} popular major for #{college.name}"
      end

      other_majors_array = college_attrs[:majors].split(",")
      other_majors_array.each do |major|
        remove_whitespaces = major.strip
        major = CollegeMajor.create(name: remove_whitespaces, college_id: college.id, most_popular: false)
        puts "Creating #{major.name} major for #{college.name}"
      end
    end
  end
end

end