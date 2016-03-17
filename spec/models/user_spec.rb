require 'rails_helper'
require 'spec_helper'

describe User, type: :model do
  let(:user)  { build :user }
  
  describe 'validations' do
    context 'roles' do
      User::ROLES.each do |role|
        it "'#{role}' is valid" do
          user.role = role
          expect(user).to be_valid
        end
      end

      [nil, 'asskisser', '18201293801', '12~3921jw~!@~#$%#&&'].each do |role|
        it "'#{role}' is invalid" do
          user.role = role
          expect(user).to_not be_valid
        end
      end      
    end
  end

  describe '#role?' do
    let(:matching_role) { 'user' }
    let(:non_matching_role) { 'contributor' }
    
    before { user.role = matching_role }

    it 'returns true when user role matches queried role' do
      expect(user.role?(matching_role)).to be(true)
    end

    it 'returns false when user role does not match queried role' do
      expect(user.role?(non_matching_role)).to be(false)
    end
  end

  describe '#full_name' do
    it 'returns first name and last name as a single string' do
      user
      expect(user.full_name).to eq('Channing Allen')
    end
  end
end
