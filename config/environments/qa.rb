require Rails.root.join("config/environments/production")

BackyardLion::Application.configure do
  config.action_mailer.default_url_options = {:host => 'https://backyard-lion-qa.herokuapp.com'}
end
