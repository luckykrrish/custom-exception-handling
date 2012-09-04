# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_custom-exception-handling_session',
  :secret      => '67f01a44d9bfaebc9c3173a9a866ca024f06a2d035d9106b533c2f886df3aebc21c29c168c25d74339fc77fa2e7d35d55e3c6bf94a47d86ef463220ce857a756'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
