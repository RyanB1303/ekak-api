require 'rails_helper'

RSpec.describe KegiatansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/kegiatans').to route_to('kegiatans#index')
    end

    it 'routes to #show' do
      expect(get: '/kegiatans/1').to route_to('kegiatans#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/kegiatans').to route_to('kegiatans#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/kegiatans/1').to route_to('kegiatans#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/kegiatans/1').to route_to('kegiatans#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/kegiatans/1').to route_to('kegiatans#destroy', id: '1')
    end
  end
end
