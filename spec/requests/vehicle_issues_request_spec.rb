# frozen_string_literal: true

describe 'Public access to issues', type: :request do
  let(:vehicle) { create(:vehicle) }
  let(:params) { { issue: build(:issue, vehicle: vehicle).attributes } }

  describe 'with no crecentials' do
    it 'denies access to issues#create' do
      expect do
        post(vehicle_issues_url(vehicle.id), params: params)
      end.not_to(change(Issue, :count))

      expect(response).to(redirect_to(user_session_url))
    end
  end

  describe 'with valid credentials' do
    let(:user) { create(:user) }

    before do
      login_as(user)
    end

    it 'create new issue' do
      expect do
        post(vehicle_issues_url(vehicle.id), params: params)
      end.to(change(Issue, :count))
    end
  end
end
