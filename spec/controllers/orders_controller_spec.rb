require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  before { login(user) }
  
  describe 'GET #index' do
    it 'renders index views' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it 'saves a new order in database' do
      expect { post :create, params: { order: attributes_for(:order) }, format: :js }.to change(Order, :count).by(1)
    end

    it 'renders create view' do
      post :create, params: { order: attributes_for(:order) }, format: :js
      expect(response).to render_template :create
    end
  end
end
