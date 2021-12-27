describe "Public access to issues", type: :request do
  let(:vehicle) { FactoryBot.create(:vehicle) }
  let(:params) { { issue: FactoryBot.build(:issue, vehicle: vehicle).attributes } }

  describe "with no crecentials" do
    it "denies access to issues#create" do
      expect {
        post vehicle_issues_url(vehicle.id), params: params
      }.to_not change(Issue, :count)

      expect(response).to redirect_to user_session_url
    end
  end

  describe "with valid credentials" do
    let(:user) { FactoryBot.create(:user) }
    before(:each) do
      login_as(user)
    end

    it "create new issue" do
      expect {
        post vehicle_issues_url(vehicle.id), params: params
      }.to change(Issue, :count)
    end
  end
end
