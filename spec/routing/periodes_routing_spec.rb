require "rails_helper"

RSpec.describe PeriodesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/periodes").to route_to("periodes#index")
    end

    it "routes to #show" do
      expect(get: "/periodes/1").to route_to("periodes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/periodes").to route_to("periodes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/periodes/1").to route_to("periodes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/periodes/1").to route_to("periodes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/periodes/1").to route_to("periodes#destroy", id: "1")
    end
  end
end
