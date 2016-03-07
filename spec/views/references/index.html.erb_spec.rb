require 'rails_helper'

RSpec.describe "references/index", type: :view do
  before(:each) do
    assign(:references, [
      Reference.create!(
        :name => "Name",
        :uri => "MyText"
      ),
      Reference.create!(
        :name => "Name",
        :uri => "MyText"
      )
    ])
  end

  it "renders a list of references" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
