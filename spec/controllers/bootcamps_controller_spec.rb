require 'rails_helper'

describe BootcampsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "shows a list of bootcamps" do
      bootcamp = FactoryGirl.create(:bootcamp)
      get :index

      expect(assigns(:bootcamps)).to eq([bootcamp])
    end

    it "should render the :index view"
    
  end

  describe "GET #show" do
    it "assigns the requested bootcamp to @bootcamp"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new Bootcamp to @bootcamp"
    it "renders the :new template"
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new bootcamp to the database"
      it "redirects to the :index template"
    end

    context "with invalid attributes" do
      it "doesn't save the bootcamp to the database"
      it "re-renders the :new template"
    end
  end

  describe "GET #edit" do
    pending
  end

  describe "PUSH #edit" do
    pending
  end
  
  describe "#update" do
    pending
  end

end
