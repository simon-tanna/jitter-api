require 'rails_helper'

RSpec.describe "Users", type: :request do

  before(:all) do
    @test_user3 = FactoryBot.create(:user, username: "TestUser3", email: "test3@example.com", password: "123456", password_confirmation: "123456")
  end

  describe "POST /auth/signin" do
    it "logs the user in with the correct credentials" do
      post '/auth/signin', params: { email: "test3@example.com", password: "123456"}
      expect(response).to have_http_status(200)
    end

    it "does not log the user in with incorrect password" do
      post '/auth/signin', params: { email: "test3@example.com", password: "123436"}
      expect(response).to have_http_status(401)
      expect(response.body).to include("Invalid username or password")
    end

    it "does not log the user in with non valid email" do
      post '/auth/signin', params: { email: "te@example.com", password: "123436"}
      expect(response).to have_http_status(401)
      expect(response.body).to include("Invalid username or password")
    end

  end
end
