require 'spec_helper'

describe FeedsController, type: :controller do
  describe '#show' do
    it 'renders show template' do
      get :show, id: '123'
      expect(response).to render_template :show
    end
  end
end
