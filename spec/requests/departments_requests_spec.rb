describe "Public access to departments", type: :request do
  let(:params) { { department: FactoryBot.attributes_for(:department) } }
  describe "with no credentials" do
    it "denies access to departments#new" do
      get new_department_url
      expect(response).to redirect_to user_session_url
    end

    it "denies access to departements#create" do
      expect {
        post departments_url, params: params
      }.to_not change(Department, :count)

      expect(response).to redirect_to user_session_url
    end
  end

  describe "with valid credentials" do
    let(:user) { FactoryBot.create(:user) }
    before(:each) do
      login_as(user)
    end

    it "returns deparments" do
      get departments_url
      expect(response).to have_http_status(:success)
    end

    it "create new department" do
      expect {
        post departments_url, params: params
      }.to change(Department, :count)
    end
  end
end
