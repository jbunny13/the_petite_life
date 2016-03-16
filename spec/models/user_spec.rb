require 'rails_helper'
require 'spec_helper'

describe User, type: :model do
  describe 'validations' do
    let(:user)  { build :user }
    let(:valid_roles) { User::ROLES }

    it 'has a valid role' do
      expect(valid_roles).to include(user.role)
    end

    it 'does not have an invalid role' do
      invalid_roles = [nil, 'asskisser', '18201293801', '12~3921jw~!@~#$%#&&']
      expect(valid_roles).not_to include(invalid_roles.sample)
    end
  end

  describe 'methods' do
    let(:user) { build(:user, role: 'user') }

    context '#role?' do
      it 'returns true when user role matches queried role' do
        role_query = 'user'
        expect(user.role == role_query).to be(true)
      end

      it 'returns false when user role does not match queried role' do
        role_query = 'contributor'
        expect(user.role == role_query).to be(false)
      end
    end

    context '#full_name' do
      it 'returns first name and last name as a single string' do
        user
        expect('Channing Allen').to eq(user.full_name)
      end
    end
  end
end
