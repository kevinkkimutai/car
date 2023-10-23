require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  describe 'POST #login' do
    context 'when given valid credentials' do
      let(:user) { FactoryBot.create(:user, email: 'test@example.com', password: 'password') }

      before do
        post :login, params: { email: user.email, password: 'password' }
      end
    end
  end
end
