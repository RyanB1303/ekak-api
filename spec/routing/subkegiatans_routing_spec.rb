require 'rails_helper'

RSpec.describe SubkegiatansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/subkegiatans').to route_to('subkegiatans#index')
    end

    it 'routes to #show' do
      expect(get: '/subkegiatans/1').to route_to('subkegiatans#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/subkegiatans').to route_to('subkegiatans#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/subkegiatans/1').to route_to('subkegiatans#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/subkegiatans/1').to route_to('subkegiatans#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/subkegiatans/1').to route_to('subkegiatans#destroy', id: '1')
    end
  end
end
