require "rails_helper"

RSpec.describe TahunsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tahuns").to route_to("tahuns#index")
    end

    it "routes to #show" do
      expect(get: "/tahuns/1").to route_to("tahuns#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tahuns").to route_to("tahuns#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tahuns/1").to route_to("tahuns#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tahuns/1").to route_to("tahuns#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tahuns/1").to route_to("tahuns#destroy", id: "1")
    end
  end
end
