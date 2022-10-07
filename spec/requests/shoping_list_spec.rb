require 'rails_helper'

RSpec.describe 'Shopping', type: :request do
  describe 'GET /shopping_list' do
    before(:example) { get '/shopping_lists' }
    it 'if a user is not should redirect to user login page' do
      expect(response).to have_http_status(302)
    end
  end
end
