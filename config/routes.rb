Rails.application.routes.draw do

  devise_for :users, :controllers => { sessions: 'sessions', registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  match '/users/:id/set_user_type' => 'users#set_user_type', via: [:get, :patch], :as => :set_user_type
  match '/users/:id/set_college' => 'users#set_college', via: [:get, :patch], :as => :set_college
  get '/users/awaiting_confirmation' => 'users#awaiting_confirmation', :as => :awaiting_confirmation
  root 'welcome#index'

  get '/about' => 'welcome#about', as: 'about'
  get '/forgot_password' => 'welcome#forgot_password', as: 'forgot_password'
  get '/privacy' => 'welcome#privacy', as: 'privacy'
  get '/terms_and_conditions' => 'welcome#terms_and_conditions', as: 'terms_and_conditions'
  get '/' =>'welcome#index', as: 'home'
  get '/byl_admin_dashboard' => 'welcome#byl_admin_dashboard', as: 'byl_admin'
  get '/signup' => 'welcome#signup', as: 'signup'
  get '/login' => 'welcome#login', as: 'login'

  match '/athlete_profiles/:id/privacy_settings' => 'athlete_profiles#privacy_settings', via: [:get], as: 'privacy_settings'
  match "/contacts/:importer/callback" => "athlete_profiles#gmail_contacts", via: [:get]

  get '/athlete_newsfeed' => 'athlete_profiles#athlete_news_feed', as: 'athlete_newsfeed'

  post '/athlete_profiles/update_notifications' => 'athlete_profiles#update_notifications'
  post '/teams/update_notifications' => 'teams#update_notifications'

  post '/athlete_profiles/update_bronze_challenge' => 'athlete_profiles#update_bronze_challenge'
  post '/athlete_profiles/register_rating' => 'athlete_profiles#register_rating'
  post '/athlete_profiles/check_ratings' => 'athlete_profiles#check_ratings'
  post '/athlete_profiles/update_athlete_contacts' => 'athlete_profiles#update_athlete_contacts'
  post '/athlete_profiles/invite_skill_endorsements' => 'athlete_profiles#invite_skill_endorsements'
  post '/athlete_profiles/invite_coach_recommendation' => 'athlete_profiles#invite_coach_recommendation'
  post '/athlete_profiles/request_promotion' => 'athlete_profiles#request_promotion'
  post '/leave_video_feedback' => 'athlete_profiles#leave_video_feedback', as: 'leave_video_feedback'
  post '/create_athlete_newsfeed_item' => 'athlete_profiles#create_athlete_newsfeed_item', as: 'create_athlete_newsfeed_item'
  post '/athlete_profiles/request_additional_feedback' => 'athlete_profiles#request_additional_feedback', as: 'request_additional_feedback'
  get '/unsubscribe_invite' => 'athlete_profiles#unsubscribe_invite', as: 'unsubscribe_invite'

  delete '/athlete_profiles/:id/delete_athlete_commitment' => 'athlete_profiles#delete_commitment', as: 'delete_commitment'
  
  resources :athlete_profiles do
    resources :athlete_recommendations
    resources :athlete_requests
    resources :interests do
      put :sort, on: :collection
    end
    member do
      post :express_interest
      post :remove_interest
      post :endorse_skill
      post :remove_skill_endorsement
      post :follow_team
      post :unfollow_team
      post :promotion_contacts
      post :request_feedback
      get :invite_contacts
      get :profile_views
      get :athlete_commitment
      get :player_card
      get :twitter_player_card
      get :remove_profile
      post :delete_my_profile
      get :rate_athletes
      get :stand_out
      get :stand_out_challenge
      get :challenge_step_one
      get :challenge_step_two
      get :challenge_step_three
      get :challenge_step_four
      get :challenge_step_five
      get :challenge_step_six
      get :challenge_step_seven
      get :challenge_step_eight
      get :challenge_step_nine
      get :challenge_step_ten
      get :challenge_step_eleven
      get :challenge_step_twelve
      get :challenge_step_thirteen
      get :challenge_step_fourteen
      get :challenge_step_fifteen
      get :challenge_step_sixteen
      get :challenge_step_seventeen
      get :challenge_step_eighteen
      get :social_media_shoutout
      get :extra_promotion
      post :request_community_promotion
    end
  end

  resources :colleges do
    resources :users
  end

  resources :teams

  resources :users do
    get :autocomplete_college_name, :on => :collection
    put :sort, on: :collection
    member do
      post :save_athlete
      post :unsave_athlete
      post :like_activity
      post :unlike_activity
      get :saved_athletes
      get :new_coach
      get :dashboard
      post :send_coach_verification
      get :resend_verification
      get :view_notifications
    end
  end

  resources :videos

  match '/teams/:id/interested_athletes' => 'teams#interested_athletes', via: [:get], as: 'interested_athletes'

end
