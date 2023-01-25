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
    context 'with valid attributes' do
      it 'saves a new order in database' do
        expect do 
          post :create, params: { order: { route_attributes: attributes_for(:route), package_attributes: attributes_for(:package) } }, format: :js
        end.to change(user.orders, :count).by(1) && change(Route, :count).by(1) && change(Package, :count).by(1)
      end
  
      it 'renders create view' do
        post :create, params: { order: { route_attributes: attributes_for(:route), package_attributes: attributes_for(:package) } }, format: :js
        expect(response).to render_template :create
      end
    end

    context 'with invalid attributes' do
      it 'does not save order in database' do
        expect { post :create, params: { order: { package_attributes: attributes_for(:package, :invalid) } }, format: :js }.to_not change(Order, :count)
      end

      it 'renders create view' do
        post :create, params: { order: { package_attributes: attributes_for(:package, :invalid) } }, format: :js
        expect(response).to render_template :create
      end
    end
  end
end
