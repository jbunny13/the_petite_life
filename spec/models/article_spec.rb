require 'rails_helper'
require 'spec_helper'
require 'support/shared_examples'

describe Article, type: :model do
  describe 'validations' do
    let(:article) { build :article }

    describe 'name' do
      it_behaves_like 'text field', :name=
    end

    describe 'content' do
      it_behaves_like 'text field', :content=
    end

    describe 'image' do
      it 'can be blank' do
        article.image = ''
        expect(article).to be_valid
      end
      
    end
  end
end
