# frozen_string_literal: true

require 'dotenv/load'
require 'sinatra'
require 'rest-client'
require 'json'
require 'octokit'


CLIENT_ID = ENV['CLIENT_ID']
CLIENT_SECRET = ENV['CLIENT_SECRET']

# This is our login page that loads up our index.erb view
# and brings our CLIEND_ID along for the ride.
  get '/' do
    erb :index, locals: { client_id: CLIENT_ID }
  end

  get '/profile' do
    # Get temp auth code
    session_code = request.env['rack.request.query_hash']['code']

    # POST Auth Grant Code + CLIENT_ID/SECRECT for access_token
    response = RestClient.post('https://github.com/login/oauth/access_token',
                    # POST payload
                    { client_id: CLIENT_ID,
                      client_secret: CLIENT_SECRET,
                      code: session_code },
                      # Request header for JSON response
                      accept: :json)

    # Parse access_token from JSON response
    access_token = JSON.parse(response)['access_token']

    # Initialize Octokit client
    client = Octokit::Client.new(access_token: access_token)

    # Create user object
    user = client.user

    # Access user data
    profile_data = { user_photo_url: user.avatar_url,
                     user_login: user.login,
                     user_name: user.name,
                     user_id: user.id }

    # Render profile page
    erb :profile, locals: profile_data
  end
