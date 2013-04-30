Ldsdate::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      #:domain               => 'beisert-btc.de',
      :user_name            => 'ldsdate@beisert-btc.de',
      :password             => 'captainmoroni',
      :authentication       => 'plain',
      :enable_starttls_auto => true  }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = false

  #david, if true then automatically activate even without email
  #this is just for test user creation  -> see user_controller.signup_complete
  config.signup_complete_activate = true

  #FB integration
  # for localhost
  configatron.facebook.key = '371180202996665'
  configatron.facebook.secret = '	4008a552192018b918525e22d84fe136'
  configatron.facebook.callback_url = "http://localhost:3000/auth/facebook"
  
end
