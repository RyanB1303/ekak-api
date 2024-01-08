require "rails_helper"

RSpec.describe StrategicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/strategics").to route_to("strategics#index")
    end

    it "routes to #show" do
      expect(get: "/strategics/1").to route_to("strategics#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/strategics").to route_to("strategics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/strategics/1").to route_to("strategics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/strategics/1").to route_to("strategics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/strategics/1").to route_to("strategics#destroy", id: "1")
    end
  end
end
