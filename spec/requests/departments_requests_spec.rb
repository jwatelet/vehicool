# frozen_string_literal: true

describe 'Public access to departments', type: :request do
  let(:params) { { department: attributes_for(:department) } }

  describe 'with no credentials' do
    it 'denies access to departments#new' do
      get new_department_url
      expect(response).to(redirect_to(user_session_url))
    end

    it 'denies access to departements#create' do
      expect do
        post(departments_url, params: params)
      end.not_to(change(Department, :count))

      expect(response).to(redirect_to(user_session_url))
    end
  end

  describe 'with valid credentials' do
    let(:user) { create(:user) }

    before do
      login_as(user)
    end

    it 'returns deparments' do
      get departments_url
      expect(response).to(have_http_status(:success))
    end

    it 'create new department' do
      expect do
        post(departments_url, params: params)
      end.to(change(Department, :count))
    end
  end
end
