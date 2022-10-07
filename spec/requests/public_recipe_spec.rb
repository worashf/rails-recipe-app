require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /public' do
    before(:example) { get '/public_recipes' }
    it 'if a user is not should redirect to user login page' do
      expect(response).to have_http_status(302)
    end
  end
end
