require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:user_email) { Faker::Internet.email }
  let(:user_pass) { Faker::Crypto.md5 }

  def stub_omniauth(provider)
    OmniAuth.config.mock_auth[provider] = OmniAuth::AuthHash.new({
      'provider' => provider.to_s,
      'uid' => '123545',
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret'
      },
      'info' => {
        'email': user_email
      }
    })

    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[provider]
  end

  context "facebook" do
    context "when facebook email doesn't exists in the system" do
      before do
        stub_omniauth(:facebook)

        get :facebook
        @user = User.find_by(email: user_email)
      end

      it "should create user" do
        expect(@user).not_to be_nil
      end

      it "should create user with provider facebook" do
        expect(@user.provider).to eq('facebook')
      end

      it "should create user with facebook id" do
        expect(@user.uid).to eq('123545')
      end

      it { should be_user_signed_in }
    end

    context "when facebook email already exist in the system" do
      let!(:user) { create(:user, email: user_email, password: 'password') }

      before do
        stub_omniauth(:facebook)
        get :facebook

        @user = User.find_by(email: user_email)
      end

      it "should update provider to facebook" do
        expect(@user.provider).to eq('facebook')
      end

      it "should update uid to facebook id" do
        expect(@user.uid).to eq('123545')
      end

      it { should be_user_signed_in }
    end
  end
end
