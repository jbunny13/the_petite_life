require 'rails_helper'

RSpec.describe "references/new", type: :view do
  before(:each) do
    assign(:reference, Reference.new(
      :name => "MyString",
      :uri => "MyText",
      :user => nil
    ))
  end

  it "renders new reference form" do
    render

    assert_select "form[action=?][method=?]", references_path, "post" do

      assert_select "input#reference_name[name=?]", "reference[name]"

      assert_select "textarea#reference_uri[name=?]", "reference[uri]"

      assert_select "input#reference_user_id[name=?]", "reference[user_id]"
    end
  end
end
