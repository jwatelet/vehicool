# frozen_string_literal: true

describe 'Public access to vehicles', type: :request do
  let(:params) { { vehicle: build(:vehicle).attributes } }

  describe 'with no crecentials' do
    it 'denies access to vehicles#new' do
      get new_vehicle_url
      expect(response).to(redirect_to(user_session_url))
    end

    it 'denies access to vehicles#create' do
      expect do
        post(vehicles_url, params: params)
      end.not_to(change(Vehicle, :count))

      expect(response).to(redirect_to(user_session_url))
    end
  end

  describe 'with valid credentials' do
    let(:user) { create(:user) }

    before do
      login_as(user)
    end

    it 'returns vehicles' do
      get vehicles_url
      expect(response).to(have_http_status(:success))
    end

    it 'create new vehicle' do
      expect do
        post(vehicles_url, params: params)
      end.to(change(Vehicle, :count))
    end
  end
end
