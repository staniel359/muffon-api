# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += %i[
  email
  image
  password
  password_confirmation
  token
  lastfm_token
  lastfm_session_key
]
