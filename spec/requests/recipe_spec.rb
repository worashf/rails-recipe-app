require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET recipes/index' do
    before(:example) { get '/recipes/' }
    it 'if a user is not should redirect to user login page' do
      expect(response).to have_http_status(302)
    end
  end
end
