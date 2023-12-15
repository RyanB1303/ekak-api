require 'rails_helper'

RSpec.describe BidangUrusansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/bidang_urusans').to route_to('bidang_urusans#index')
    end

    it 'routes to #show' do
      expect(get: '/bidang_urusans/1').to route_to('bidang_urusans#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/bidang_urusans').to route_to('bidang_urusans#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/bidang_urusans/1').to route_to('bidang_urusans#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/bidang_urusans/1').to route_to('bidang_urusans#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/bidang_urusans/1').to route_to('bidang_urusans#destroy', id: '1')
    end
  end
end
