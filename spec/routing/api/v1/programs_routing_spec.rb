require 'rails_helper'

RSpec.describe Api::V1::ProgramsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/programs').to route_to('api/v1/programs#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/programs/1').to route_to('api/v1/programs#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/programs').to route_to('api/v1/programs#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v1/programs/1').to route_to('api/v1/programs#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v1/programs/1').to route_to('api/v1/programs#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/programs/1').to route_to('api/v1/programs#destroy', id: '1')
    end
  end
end
