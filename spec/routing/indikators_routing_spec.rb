require 'rails_helper'

RSpec.describe IndikatorsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/indikators').to route_to('indikators#index')
    end

    it 'routes to #show' do
      expect(get: '/indikators/1').to route_to('indikators#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/indikators').to route_to('indikators#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/indikators/1').to route_to('indikators#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/indikators/1').to route_to('indikators#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/indikators/1').to route_to('indikators#destroy', id: '1')
    end
  end
end
