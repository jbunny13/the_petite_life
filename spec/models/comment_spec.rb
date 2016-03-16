require 'rails_helper'
require 'spec_helper'
require 'support/shared_examples'

describe Comment, type: :model do
  describe 'validations' do
    let(:comment) { build :comment }

    describe 'content' do
      it_behaves_like 'text field', :content=
    end
  end
end
