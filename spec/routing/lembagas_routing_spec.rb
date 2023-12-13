require "rails_helper"

RSpec.describe LembagasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lembagas").to route_to("lembagas#index")
    end

    it "routes to #show" do
      expect(get: "/lembagas/1").to route_to("lembagas#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lembagas").to route_to("lembagas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lembagas/1").to route_to("lembagas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lembagas/1").to route_to("lembagas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lembagas/1").to route_to("lembagas#destroy", id: "1")
    end
  end
end
