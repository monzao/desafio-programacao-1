require 'rails_helper'

RSpec.describe UploadsController, type: :controller do

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

    it 'assigns @purchases with the parsed purchases' do
      expect(assigns(:purchases)).not_to be_present
    end
  end

end
