# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_back_session',
  :secret      => '19e07c58bafa7f534b222510233b87ee120436e8ee52036d27b1721fc5fcb4c13df5478e74cece45bb2ad27b5c69811837933b1b2746728f4e583ed0c83edab2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
