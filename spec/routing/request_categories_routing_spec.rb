require "rails_helper"

RSpec.describe RequestCategoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/request_categories").to route_to("request_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/request_categories/new").to route_to("request_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/request_categories/1").to route_to("request_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/request_categories/1/edit").to route_to("request_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/request_categories").to route_to("request_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/request_categories/1").to route_to("request_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/request_categories/1").to route_to("request_categories#destroy", :id => "1")
    end

  end
end
