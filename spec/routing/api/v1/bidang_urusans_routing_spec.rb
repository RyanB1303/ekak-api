require 'rails_helper'

RSpec.describe Api::V1::BidangUrusansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/bidang_urusans').to route_to('api/v1/bidang_urusans#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/bidang_urusans/1').to route_to('api/v1/bidang_urusans#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/bidang_urusans').to route_to('api/v1/bidang_urusans#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v1/bidang_urusans/1').to route_to('api/v1/bidang_urusans#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v1/bidang_urusans/1').to route_to('api/v1/bidang_urusans#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/bidang_urusans/1').to route_to('api/v1/bidang_urusans#destroy', id: '1')
    end
  end
end
