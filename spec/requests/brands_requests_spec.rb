describe "Public access to brands", type: :request do
  let(:params) { { brand: FactoryBot.attributes_for(:brand) } }

  describe "with no credentials" do
    it "denies access to brands#new" do
      get new_brand_url
      expect(response).to redirect_to user_session_url
    end

    it "denies access to contacts#create" do
      expect {
        post brands_url, params: params
      }.to_not change(Brand, :count)

      expect(response).to redirect_to user_session_url
    end
  end

  describe "with valid credentials" do
    let(:user) { FactoryBot.create(:user) }
    before(:each) do
      login_as(user)
    end

    it "returns all brands" do
      get brands_url
      expect(response).to have_http_status(:success)
    end

    it "create new brand" do
      expect {
        post brands_url, params: params
      }.to change(Brand, :count)
    end
  end
end
