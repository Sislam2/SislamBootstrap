require 'rails_helper'

RSpec.shared_examples "SharedCrudController" do
  let!(:user){ create(:user) }
  let!(:resource_class){ described_class.resource_class }
  let!(:resource_name){ described_class.resource_class.to_s.parameterize }

  before(:each){
    @request.env["devise.mapping"] = Devise.mappings[resource_name]
    sign_in user
  }

  describe "Helper Methods" do
    it "returns form_params not be blank" do
      expect(controller.helpers.form_params).not_to be_blank
    end
    it "returns index_columns not be blank" do
      expect(controller.helpers.index_columns).not_to be_blank
    end
    it "returns search_columns not be blank" do
      expect(controller.helpers.search_columns).not_to be_blank
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "search and returns http success" do
      search_params = { controller.helpers.search_columns.first => 'teste' }
      get :index, params: {q: search_params}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(assigns(resource_name)).to be_a_new(resource_class)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      expect { post :create, params: {resource_name => attributes_for(resource_name)} }.to  change(resource_class, :count)
      expect(response).to have_http_status(:redirect)
    end
  end

  context "Resource" do
    let!(:resource){ create(resource_name.to_sym) }

    describe "GET #show" do
      it "returns http success" do
        get :show, params: {id: resource.to_param}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, params: {id: resource.to_param}
        expect(response).to have_http_status(:success)
      end
    end

    describe "PUT #update" do
      it "returns http success" do
        put :update, params: {id: resource.id, resource_name => {name: 'ola'}}
        expect(assigns(resource_name).name).to eq('ola')
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "DELETE #destroy" do
      it "returns http success" do
        expect { delete :destroy, params: {id: resource.to_param} }.to  change(resource_class, :count)
        expect(response).to have_http_status(:redirect)
      end
    end
  end

end
