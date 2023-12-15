require "rails_helper"

RSpec.describe UrusansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/urusans").to route_to("urusans#index")
    end

    it "routes to #show" do
      expect(get: "/urusans/1").to route_to("urusans#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/urusans").to route_to("urusans#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/urusans/1").to route_to("urusans#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/urusans/1").to route_to("urusans#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/urusans/1").to route_to("urusans#destroy", id: "1")
    end
  end
end
