describe "Public access to vehicles", type: :request do
  let(:params) { { vehicle: FactoryBot.build(:vehicle).attributes } }
  describe "with no crecentials" do
    it "denies access to vehicles#new" do
      get new_vehicle_url
      expect(response).to redirect_to user_session_url
    end

    it "denies access to vehicles#create" do
      expect {
        post vehicles_url, params: params
      }.to_not change(Vehicle, :count)

      expect(response).to redirect_to user_session_url
    end
  end

  describe "with valid credentials" do
    let(:user) { FactoryBot.create(:user) }
    before(:each) do
      login_as(user)
    end

    it "returns vehicles" do
      get vehicles_url
      expect(response).to have_http_status(:success)
    end

    it "create new vehicle" do
      expect {
        post vehicles_url, params: params
      }.to change(Vehicle, :count)
    end
  end
end
