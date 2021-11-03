require "rails_helper"

RSpec.describe BrandsController, type: :controller do
  let(:valid_attributes) {
    { :name => "Test title!" }
  }

  describe "GET #index" do
    describe "with logged user" do
      login_user
      it "returns a success response" do
        Brand.create! valid_attributes
        get :index
        expect(response).to be_successful # be_successful expects a HTTP Status code of 200
        # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
      end
    end
    describe "with no logged user" do
      it "returns a success response" do
        Brand.create! valid_attributes
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end
end
