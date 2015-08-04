require 'rails_helper'

describe StaticPagesController, type: :controller do
  render_views

  describe 'GET #home' do
    before(:each) do
      get :home
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "says 'Welcome'" do
      expect(response.body).to match /Welcome/
    end
  end

  describe 'GET #about' do
    before(:each) do
      get :about
    end

    it "respondds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "says 'About Us'" do
      expect(response.body).to match /About Us/
    end
  end
end
