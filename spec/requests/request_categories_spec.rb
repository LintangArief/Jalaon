require 'rails_helper'

RSpec.describe "RequestCategories", :type => :request do
  describe "GET /request_categories" do
    it "works! (now write some real specs)" do
      get request_categories_path
      expect(response.status).to be(200)
    end
  end
end
