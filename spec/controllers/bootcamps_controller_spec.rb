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

    it "should render the :index view" do
      get :index

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    let(:bootcamp) { FactoryGirl.create(:bootcamp) }

    it "assigns the requested bootcamp to @bootcamp" do
      get :show, id: bootcamp

      expect(assigns(:bootcamp)).to eq(bootcamp)
    end

    it "renders the :show template" do
      get :show, id: bootcamp
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Bootcamp to @bootcamp" do
      get :new
      expect(assigns(:bootcamp)).to be_a_new(Bootcamp)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe "POST #create" do
    let(:bootcamp) {FactoryGirl.attributes_for(:bootcamp)}

    context "with valid attributes" do
      it "saves the new bootcamp to the database" do
        expect{ 
          post :create, bootcamp: bootcamp
        }.to change(Bootcamp,:count).by(1)
      end

      it "redirects to the new Bootcamp view" do
        post :create, bootcamp: bootcamp
        expect(response).to redirect_to Bootcamp.last
      end
    end

    context "with invalid attributes" do
      it "doesn't save the bootcamp to the database" do
        @invalid_bootcamp = FactoryGirl.attributes_for(:invalid_bootcamp)
        expect{ 
          post :create, bootcamp: @invalid_bootcamp
        }.to_not change(Bootcamp,:count)

      end
      it "re-renders the :new template" do
        @invalid_bootcamp = FactoryGirl.attributes_for(:invalid_bootcamp)
        post :create, bootcamp: @invalid_bootcamp
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    let(:bootcamp) { FactoryGirl.create(:bootcamp) }

    it "assigns bootcamp to @bootcamp" do
      get :edit, id: bootcamp

      expect(assigns(:bootcamp)).to eq(bootcamp)
    end

    it "renders the edit template" do
      get :edit, id: bootcamp
      expect(response).to render_template :edit
    end

  end

  describe "PUT #update" do
    let(:bootcamp) { FactoryGirl.create(:bootcamp, name: 'App Academy', rating: 3) }

    context "valid attributes" do
      it "looked the requested @bootcamp" do
        put :update, id: bootcamp, bootcamp: FactoryGirl.attributes_for(:bootcamp)
        expect(assigns(:bootcamp)).to eq(bootcamp)
      end

      it "changed @bootcamp's attributes" do
        put :update, id: bootcamp, bootcamp: FactoryGirl.attributes_for(:bootcamp, rating: 5)
        bootcamp.reload
        expect(bootcamp.rating).to eq(5)
      end

      it "redirects to the update bootcamp's page" do
        put :update, id: bootcamp, bootcamp: FactoryGirl.attributes_for(:bootcamp)
        expect(response).to redirect_to bootcamp
      end
    end

    context "invalid attributes" do
      it "looked up the requested bootcamp" do
        put :update, id: bootcamp, bootcamp: FactoryGirl.attributes_for(:invalid_bootcamp)
        expect(assigns(:bootcamp)).to eq(bootcamp)
      end

      it "does not save the attributes" do
        put :update, id: bootcamp, bootcamp: FactoryGirl.attributes_for(:invalid_bootcamp)
        bootcamp.reload
        expect(bootcamp.rating).to eq(3)
      end

      it "reloads the edit page" do
        put :update, id: bootcamp, bootcamp: FactoryGirl.attributes_for(:invalid_bootcamp)
        expect(response).to render_template :edit
      end

    end
  end

end
