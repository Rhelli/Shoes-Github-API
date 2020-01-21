# spec/server_spec.rb

require 'rack/test'
require 'rspec'


ENV['RACK_ENV'] = 'test'

require File.expand_path './server.rb'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }

describe 'Sinatra server process' do
  describe ENV do
    it 'should fetch CLIENT_ID using dotenv' do
      expect(CLIENT_ID = ENV['CLIENT_ID']).to eql('206dd8b35895e3991cbb')
    end

    it 'should fetch CLIENT_SECRET using dotenv' do
      expect(CLIENT_SECRET = ENV['CLIENT_SECRET']).to eql('bef0fc132918c983f43bf27658ff52d772834a8a')
    end
  end
  
  describe 'Get process' do
    it 'Should demonstrate that the Sinatra server is active' do
      get '/'
      expect(last_response).to be_ok
    end

    it 'Should deny authorization to users profile data' do
      expect(get '/profile').to raise_error
    end
  end


end
