require 'rails_helper'

describe StaticPagesController, type: :controller do

  describe 'GET #home' do
    before(:each) do
      get :home
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should render the :home view" do
      response.should render_template :home
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

    it "should render the :about view" do
      response.should render_template :about
    end
  end
end
