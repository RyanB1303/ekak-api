require "rails_helper"

RSpec.describe OpdsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/opds").to route_to("opds#index")
    end

    it "routes to #show" do
      expect(get: "/opds/1").to route_to("opds#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/opds").to route_to("opds#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/opds/1").to route_to("opds#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/opds/1").to route_to("opds#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/opds/1").to route_to("opds#destroy", id: "1")
    end
  end
end
