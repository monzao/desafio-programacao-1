require 'rails_helper'

RSpec.describe 'User Login', type: :request do
  let(:user) { create(:user) }

  describe 'register a new session' do
    context 'GET login form' do
      before { get new_user_session_path }

      subject { response }

      it { is_expected.to have_http_status(200)  }
      it { is_expected.to render_template :new }
    end

    context 'POST user data' do
      let(:user_params) { { email: user.email, password: user.password } }

      before { post user_session_path, params: { user: user_params } }

      context 'with valid data' do
        subject { response }

        it { is_expected.to have_http_status(302) }
        it { is_expected.to_not render_template :new }
        it { is_expected.to redirect_to root_path }

        it 'expects controller to have the right current_user' do
          expect(controller.current_user).to eq user
        end
      end

      context 'with password' do
        {empty: '', wrong: Faker::Crypto.sha1}.each do |password_type, password|
          context password_type do
            let(:user_params) { { email: user.email, password: password } }
            subject { response }

            it { is_expected.to have_http_status(200) }
            it { is_expected.to render_template :new }
          end
        end
      end
    end
  end
end
