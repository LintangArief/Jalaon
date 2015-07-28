require 'rails_helper'

RSpec.describe "request_categories/show", :type => :view do
  before(:each) do
    @request_category = assign(:request_category, RequestCategory.create!(
      :service_category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
