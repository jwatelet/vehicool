# frozen_string_literal: true

describe 'Public access to brands', type: :request do
  let(:params) { { brand: attributes_for(:brand) } }

  describe 'with no credentials' do
    it 'denies access to brands#new' do
      get new_brand_url
      expect(response).to(redirect_to(user_session_url))
    end

    it 'denies access to contacts#create' do
      expect do
        post(brands_url, params: params)
      end.not_to(change(Brand, :count))

      expect(response).to(redirect_to(user_session_url))
    end
  end

  describe 'with valid credentials' do
    let(:user) { create(:user) }

    before do
      login_as(user)
    end

    it 'returns brands' do
      get brands_url
      expect(response).to(have_http_status(:success))
    end

    it 'create new brand' do
      expect do
        post(brands_url, params: params)
      end.to(change(Brand, :count))
    end
  end
end
