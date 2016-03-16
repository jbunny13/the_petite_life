require 'rails_helper'
require 'spec_helper'

shared_examples 'text field' do |method|
  let(:resource) { create(described_class) }

  it 'exists' do
    resource.send(method, nil)
    expect(resource).not_to be_valid
  end

  it 'is at least 5 characters' do
    resource.send(method, 'abcd')
    expect(resource).not_to be_valid
    resource.send(method, 'abcde')
    expect(resource).to be_valid        
  end      
end
