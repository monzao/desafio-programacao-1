require 'rails_helper'

RSpec.describe 'User Registrations', type: :request do
  describe 'register a new user' do
    context 'GET empty form' do
      before { get new_user_registration_path }

      subject { response }
      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template :new }
    end

    context 'POST user data' do
      let(:user) do
        { email: Faker::Internet.email, password: Faker::Crypto.md5 }
      end

      before { post user_registration_path, params: { user: user } }

      context 'with valid data' do
        subject { response }
        it { is_expected.to have_http_status(302) }
        it { is_expected.to redirect_to root_path }
        it { is_expected.to_not render_template :new }

        context 'controller#current_user' do
          subject { controller.current_user }

          it 'email is the registered one' do
            expect(subject.email).to eq user[:email]
          end

          it 'is not confirmed yet' do
            expect(subject.confirmed_at?).to be_falsey
          end
        end
      end

      context 'with password: ' do
        { empty: '', insufficient: '12345' }.each do |type, password|
          context type do
            let(:user) { { email: Faker::Internet.email, password: password } }
            subject { response }
            it { is_expected.to have_http_status(200) }
            it { is_expected.to render_template :new }
          end
        end
      end
    end
  end
end
