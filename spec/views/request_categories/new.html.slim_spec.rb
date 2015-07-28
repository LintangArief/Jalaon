require 'rails_helper'

RSpec.describe "request_categories/new", :type => :view do
  before(:each) do
    assign(:request_category, RequestCategory.new(
      :service_category => nil
    ))
  end

  it "renders new request_category form" do
    render

    assert_select "form[action=?][method=?]", request_categories_path, "post" do

      assert_select "input#request_category_service_category_id[name=?]", "request_category[service_category_id]"
    end
  end
end
