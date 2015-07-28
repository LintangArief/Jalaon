require 'rails_helper'

RSpec.describe "request_categories/index", :type => :view do
  before(:each) do
    assign(:request_categories, [
      RequestCategory.create!(
        :service_category => nil
      ),
      RequestCategory.create!(
        :service_category => nil
      )
    ])
  end

  it "renders a list of request_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
