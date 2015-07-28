require 'rails_helper'

RSpec.describe "request_categories/edit", :type => :view do
  before(:each) do
    @request_category = assign(:request_category, RequestCategory.create!(
      :service_category => nil
    ))
  end

  it "renders the edit request_category form" do
    render

    assert_select "form[action=?][method=?]", request_category_path(@request_category), "post" do

      assert_select "input#request_category_service_category_id[name=?]", "request_category[service_category_id]"
    end
  end
end
