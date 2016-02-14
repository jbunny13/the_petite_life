require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :comment => "MyText",
      :product => nil
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "textarea#review_comment[name=?]", "review[comment]"

      assert_select "input#review_product_id[name=?]", "review[product_id]"
    end
  end
end
