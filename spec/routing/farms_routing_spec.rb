require "spec_helper"

describe FarmsController do
  describe "routing" do

    it "routes to #index" do
      get("/farms").should route_to("farms#index")
    end

    it "routes to #new" do
      get("/farms/new").should route_to("farms#new")
    end

    it "routes to #show" do
      get("/farms/1").should route_to("farms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/farms/1/edit").should route_to("farms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/farms").should route_to("farms#create")
    end

    it "routes to #update" do
      put("/farms/1").should route_to("farms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/farms/1").should route_to("farms#destroy", :id => "1")
    end

  end
end
