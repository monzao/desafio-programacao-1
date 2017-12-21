require 'rails_helper'

RSpec.describe UploadsController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  describe '#new' do
    context 'Rendering' do
      it 'responds successfully' do
        expect(response).to be_success
      end

      it 'renders the new template' do
        get :new
        assert_template 'uploads/new'
      end
    end
  end

  describe '#create' do
    it 'responds successfully' do
      expect(response).to be_success
    end

    it 'renders the create template' do
      post :create
      assert_template 'uploads/create'
    end

    context 'File Upload' do
      let(:file) do
        Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'example_input.tab'))
      end
      let(:params)  { { file: file } }
      let(:request) { post :create, params: params }

      context 'assigned purchases' do
        before { request }

        it 'assigns @purchases with the parsed purchases' do
          expect(assigns(:purchases)).to be_present
        end

        it 'expects @purchases to have at least one record' do
          expect(assigns(:purchases).size).to be >= 1
        end
      end

      it 'persists purchases' do
        expect { request }.to change(Purchase, :count).by(4)
      end
    end
  end
end
