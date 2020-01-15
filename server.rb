require 'dotenv/load'
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

CLIENT_ID = ENV['CLIENT_ID']
CLIENT_SECRET = ENV['CLIENT_SECRET']


# This is our login page that loads up our index.erb view
# and brings our CLIEND_ID along for the ride.
get '/' do
  erb :index, :locals => {:client_id => CLIENT_ID}
end


# This is our 'logged-in' view, displaying profile.erb after the user has
# authenticated with GitHub (this is the 'callback URL' we entered when
# registering our OAUth Application on GitHub.com).
get '/profile' do
  # Retrieve temporary authorization grant code
  session_code = request.env['rack.request.query_hash']['code']
  
  # POST Auth Grant Code + CLIENT_ID/SECRECT in exchange for our access_token
  response = RestClient.post('https://github.com/login/oauth/access_token',
                  # POST payload
                  {:client_id => CLIENT_ID,
                  :client_secret => CLIENT_SECRET,
                  :code => session_code},
                  # Request header for JSON response
                  :accept => :json)
  
  # Parse access_token from JSON response
  access_token = JSON.parse(response)['access_token']
  
  # Initialize Octokit client with user access_token
  client = Octokit::Client.new(:access_token => access_token)
  
  # Create user object for less typing
  user = client.user
  
  # Access user data
  profile_data = {:user_photo_url => user.avatar_url,
                  :user_login => user.login,
                  :user_name => user.name,
                  :user_id => user.id }       
  
  # Render profile page, passing in user profile data to be displayed
  erb :profile, :locals => profile_data
end