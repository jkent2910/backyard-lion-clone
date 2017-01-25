# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170102201427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "activity_type"
    t.integer  "athlete_profile_id"
    t.integer  "associated_activity_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "media_comment"
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.datetime "media_updated_at"
  end

  create_table "activity_likes", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "liker_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "athlete_awards", force: :cascade do |t|
    t.string   "name"
    t.string   "issuer"
    t.string   "year"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "athlete_profile_id"
    t.string   "other_name"
  end

  create_table "athlete_experiences", force: :cascade do |t|
    t.string   "position"
    t.string   "team_name"
    t.string   "sport"
    t.string   "city"
    t.string   "state"
    t.text     "description"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "athlete_profile_id"
    t.string   "level"
    t.integer  "videos_count",       default: 0, null: false
    t.string   "secondary_position"
  end

  create_table "athlete_notifications", force: :cascade do |t|
    t.integer  "athlete_profile_id"
    t.string   "notification_type"
    t.integer  "notification_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "viewed",             default: false
    t.boolean  "test_flag",          default: false, null: false
  end

  create_table "athlete_photos", force: :cascade do |t|
    t.integer  "athlete_profile_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "athlete_profile_views", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "athlete_profile_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "other_athlete_profile_id"
    t.integer  "profile_view_type"
  end

  add_index "athlete_profile_views", ["athlete_profile_id"], name: "index_athlete_profile_views_on_athlete_profile_id", using: :btree
  add_index "athlete_profile_views", ["team_id"], name: "index_athlete_profile_views_on_team_id", using: :btree

  create_table "athlete_profiles", force: :cascade do |t|
    t.integer  "gender"
    t.string   "country"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.decimal  "height_feet"
    t.decimal  "height_inches"
    t.decimal  "weight"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "user_id"
    t.date     "birthday"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.string   "school_name"
    t.string   "graduation_year"
    t.text     "activities_societies"
    t.string   "cum_gpa_score"
    t.string   "cum_gpa_out_of"
    t.string   "cum_gpa_scale"
    t.string   "core_gpa_score"
    t.string   "core_gpa_out_of"
    t.string   "weighted_gpa_score"
    t.string   "weighted_gpa_out_of"
    t.string   "class_rank"
    t.string   "class_rank_out_of"
    t.string   "weighted_class_rank"
    t.string   "weighted_class_rank_out_of"
    t.string   "sat_total"
    t.string   "sat_math"
    t.string   "sat_reading"
    t.string   "sat_writing"
    t.string   "act_total"
    t.string   "preferred_method_contact"
    t.string   "primary_phone"
    t.string   "primary_phone_type"
    t.string   "secondary_phone"
    t.string   "secondary_phone_type"
    t.string   "primary_email"
    t.string   "secondary_email"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "instagram_url"
    t.string   "guardian_relationship"
    t.string   "guardian_first_name"
    t.string   "guardian_last_name"
    t.string   "guardian_primary_phone"
    t.string   "guardian_primary_phone_type"
    t.string   "guardian_secondary_phone"
    t.string   "guardian_secondary_phone_type"
    t.string   "guardian_primary_email"
    t.string   "guardian_edu_level"
    t.string   "guardian_two_relationship"
    t.string   "guardian_two_first_name"
    t.string   "guardian_two_last_name"
    t.string   "guardian_two_primary_phone"
    t.string   "guardian_two_primary_phone_type"
    t.string   "guardian_two_secondary_phone"
    t.string   "guardian_two_secondary_phone_type"
    t.string   "guardian_two_primary_email"
    t.string   "guardian_two_edu_level"
    t.string   "mailing_address"
    t.string   "mailing_city"
    t.string   "mailing_state"
    t.string   "mailing_zipcode"
    t.string   "sat_2_total"
    t.string   "sat_2_math"
    t.string   "sat_2_reading"
    t.string   "sat_2_writing"
    t.string   "psat_total"
    t.text     "honor_classes"
    t.text     "preferred_major"
    t.decimal  "profile_strength"
    t.integer  "contact_info_privacy",              default: 2
    t.integer  "academic_info_privacy",             default: 1
    t.float    "athlete_height"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "school_commit"
    t.string   "sport_commit"
    t.text     "contacts"
    t.boolean  "profile_view_email",                default: true
    t.integer  "contacts_invited"
    t.string   "guardian_twitter"
    t.string   "guardian_facebook"
    t.string   "second_guardian_twitter"
    t.string   "second_guardian_facebook"
    t.integer  "athlete_experiences_count",         default: 0,     null: false
    t.integer  "athlete_notifications_count",       default: 0,     null: false
    t.datetime "challenge_step_fourteen_time"
    t.boolean  "finish_bronze",                     default: false
  end

  create_table "athlete_ratings", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "athlete_experience_id"
    t.integer  "rating"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "athlete_recommendations", force: :cascade do |t|
    t.integer  "athlete_profile_id"
    t.string   "giver_first_name"
    t.string   "giver_last_name"
    t.string   "giver_contact_info"
    t.string   "giver_relationship"
    t.integer  "giver_athlete_profile_id"
    t.string   "giver_position"
    t.text     "recommendation_text"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "athlete_experience_id"
  end

  create_table "athlete_requests", force: :cascade do |t|
    t.integer  "athlete_profile_id"
    t.string   "athlete_profile_field"
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "characteristic_answers", force: :cascade do |t|
    t.integer  "athlete_profile_id"
    t.integer  "characteristic_id"
    t.text     "athlete_answer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "characteristics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coach_contacts", force: :cascade do |t|
    t.integer  "college_id"
    t.string   "college_name"
    t.integer  "team_id"
    t.string   "sport"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "coaches", force: :cascade do |t|
    t.string   "sport"
    t.string   "position"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "primary_phone"
    t.string   "primary_phone_type"
    t.string   "secondary_phone"
    t.string   "secondary_phone_type"
    t.string   "email"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "athlete_profile_id"
  end

  create_table "college_majors", force: :cascade do |t|
    t.string   "name"
    t.boolean  "most_popular"
    t.integer  "college_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "state"
    t.string   "city"
    t.string   "enrollment"
    t.string   "campus_setting"
    t.string   "school_type"
    t.string   "tuition_in_state"
    t.string   "tuition_out_of_state"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "email_prefix"
    t.string   "website"
    t.string   "governing_body"
    t.string   "college_division"
    t.string   "college_conference"
    t.string   "acceptance_rate"
    t.string   "sat_range"
    t.string   "act_range"
    t.string   "application_fee"
    t.string   "application_website"
    t.string   "net_price"
    t.string   "overall_grade"
    t.string   "academics_grade"
    t.string   "diversity_grade"
    t.string   "athletics_grade"
    t.string   "professors_grade"
    t.string   "dorms_grade"
    t.string   "student_life_grade"
    t.string   "value_grade"
    t.string   "campus_grade"
    t.string   "party_scene_grade"
    t.string   "location_grade"
    t.string   "safety_grade"
    t.string   "student_faculty_ratio"
    t.string   "financial_aid_percentage"
    t.string   "avg_total_aid_awarded"
    t.string   "graduation_rate"
    t.string   "num_years"
    t.string   "address"
    t.string   "median_earnings"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "video_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "endorsement_invites", force: :cascade do |t|
    t.string   "email"
    t.integer  "invited_by_user_id"
    t.integer  "invite_sent_count"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "endorsements", force: :cascade do |t|
    t.integer  "athlete_profile_id"
    t.integer  "endorser_id"
    t.integer  "skill_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_type"
  end

  create_table "factor_choices", force: :cascade do |t|
    t.integer  "factor_id"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factor_preferences", force: :cascade do |t|
    t.integer  "factor_id"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factor_ratings", force: :cascade do |t|
    t.integer  "athlete_profile_id"
    t.integer  "factor_id"
    t.integer  "factor_choice_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "factor_preference_id"
  end

  add_index "factor_ratings", ["athlete_profile_id"], name: "index_factor_ratings_on_athlete_profile_id", using: :btree
  add_index "factor_ratings", ["factor_id"], name: "index_factor_ratings_on_factor_id", using: :btree

  create_table "factors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followers", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "athlete_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "followers", ["athlete_profile_id"], name: "index_followers_on_athlete_profile_id", using: :btree
  add_index "followers", ["team_id"], name: "index_followers_on_team_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "athlete_profile_id"
    t.integer  "interest_level"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "row_order"
  end

  add_index "interests", ["athlete_profile_id"], name: "index_interests_on_athlete_profile_id", using: :btree
  add_index "interests", ["team_id"], name: "index_interests_on_team_id", using: :btree

  create_table "invited_contacts", force: :cascade do |t|
    t.string   "email"
    t.integer  "invited_by_user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "invite_sent_count"
  end

  create_table "new_athlete_invites", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "grad_year"
    t.string   "state"
    t.string   "sport"
    t.string   "high_school"
    t.string   "invite_count"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "last_invite_sent"
  end

  create_table "region_preferences", force: :cascade do |t|
    t.integer  "region_id"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "region_ratings", force: :cascade do |t|
    t.integer  "athlete_profile_id"
    t.integer  "region_id"
    t.integer  "region_preference_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saved_athletes", force: :cascade do |t|
    t.integer  "athlete_profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "rank_order"
  end

  add_index "saved_athletes", ["athlete_profile_id"], name: "index_saved_athletes_on_athlete_profile_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "units"
    t.integer  "athlete_profile_id"
    t.string   "skill_result"
    t.string   "skill_result_year"
    t.string   "skill_result_video_link"
  end

  create_table "state_preferences", force: :cascade do |t|
    t.integer  "state_id"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "state_ratings", force: :cascade do |t|
    t.integer  "athlete_profile_id"
    t.integer  "state_id"
    t.integer  "state_preference_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.string   "stat"
    t.decimal  "result"
    t.string   "result_unit"
    t.string   "year"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "athlete_experience_id"
  end

  create_table "team_notifications", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "notification_type"
    t.boolean  "viewed"
    t.integer  "other_user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "team_ratings", force: :cascade do |t|
    t.integer  "college_id"
    t.integer  "factor_id"
    t.integer  "factor_preference_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "sport_name"
    t.string   "sport_division"
    t.string   "sport_conference"
    t.string   "playing_style"
    t.string   "playing_time"
    t.string   "coach_prestige"
    t.string   "conference_prestige"
    t.string   "pro_potential"
    t.string   "program_tradition"
    t.string   "television_exposure"
    t.string   "athletic_facilities"
    t.string   "championship_contender"
    t.string   "stadium_atmosphere"
    t.string   "academic_prestige"
    t.string   "campus_lifestyle"
    t.string   "coach_stability"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "college_id"
    t.integer  "sport_gender"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_type"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "college_admin_flag",     default: false
    t.boolean  "referred_flag",          default: false
    t.string   "coach_sport"
    t.string   "coach_position"
    t.string   "token"
    t.integer  "team_id"
    t.boolean  "team_validated",         default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "athlete_experience_id"
  end

  add_foreign_key "identities", "users"
end
