require 'rails_helper'
require 'spec_helper'
require 'support/shared_examples'

describe Product, type: :model do
  describe 'validations' do
  let(:product) { build :product }

  describe 'name' do
    it_behaves_like 'text field', :name=
  end

  describe 'description' do
    it_behaves_like 'text field', :description=
  end
end
