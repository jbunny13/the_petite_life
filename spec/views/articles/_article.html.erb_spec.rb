require 'rails_helper'
require 'spec_helper'

describe "views/articles/_article.html.erb" do
  context "with user" do
    let(:user)  { build :user }
    let(:article) { build :article }

    it "renders name" do
      render article
      expect(rendered).to have_name "We Learn Nothing"
    end
  end
end