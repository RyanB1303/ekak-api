require "rails_helper"

RSpec.describe TujuansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tujuans").to route_to("tujuans#index")
    end

    it "routes to #show" do
      expect(get: "/tujuans/1").to route_to("tujuans#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tujuans").to route_to("tujuans#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tujuans/1").to route_to("tujuans#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tujuans/1").to route_to("tujuans#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tujuans/1").to route_to("tujuans#destroy", id: "1")
    end
  end
end
