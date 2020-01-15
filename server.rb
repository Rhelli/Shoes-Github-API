require 'sinatra' 		# Our handy lightweight webserver
require 'rest-client' 	# Used for authentication with the GitHub OAuth API
require 'json' 			# Used to parse the JSON response from the GitHub OAuth API
require 'octokit' 		# Used to retrieve user data after authentication

=begin
[ !IMPORTANT! ]
In production, the CLIENT_ID & CLIENT_SECRET (below) should never be
hard-coded or exposed. Instead, you should export environment
variables for these values. NEVER check your CLIENT_ID or CLIENT_SECRET
into a git repository that is or may become public.

In production, these values should be accessed as environement variables
like this: CLIENT_ID = ENV['CLIENT_ID']
=end

CLIENT_ID = '206dd8b35895e3991cbb'
CLIENT_SECRET = 'c64f8e4f26b229ff3ded6162a5cf09bb1454775c'


# This is our login page that loads up our index.erb view
# and brings our CLIEND_ID along for the ride.
get '/' do
  erb :index, :locals => {:client_id => CLIENT_ID}
end


# This is our 'logged-in' view, displaying profile.erb after the user has
# authenticated with GitHub (this is the 'callback URL' we entered when
# registering our OAUth Application on GitHub.com).
get '/profile' do
  # Retrieve temp auth grant code
  session_code = request.env['rack.request.query_hash']['code']

  # POST Auth grant code + Client ID/Secret ID in exchange for access_token
  response = RestClient.post('https://github.com/login/oauth/access_token',
    # POST
    {:client_id => CLIENT_ID
    :client_secret => CLIENT_SECRET
    :code => session_code},
    # Request header for JSON response
    :accept => :json)

  access_token = JSON.parse(response)['access_token']
	erb :profile
end