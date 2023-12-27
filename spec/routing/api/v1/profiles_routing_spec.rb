require 'rails_helper'

RSpec.describe Api::V1::ProfilesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/users/1/profiles').to route_to('api/v1/profiles#index', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/users/1/profiles/1').to route_to('api/v1/profiles#show', user_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/users/1/profiles').to route_to('api/v1/profiles#create', user_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v1/users/1/profiles/1').to route_to('api/v1/profiles#update', user_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v1/users/1/profiles/1').to route_to('api/v1/profiles#update', user_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/users/1/profiles/1').to route_to('api/v1/profiles#destroy', user_id: '1', id: '1')
    end
  end
end
