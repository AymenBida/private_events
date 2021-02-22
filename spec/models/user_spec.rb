require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'assosiations' do
    it 'can have many events' do
      user = User.reflect_on_association(:events)
      expect(user.macro).to eql(:has_many)
    end
    it 'can have many invitations' do
      user = User.reflect_on_association(:invitations)
      expect(user.macro).to eql(:has_many)
    end
  end
end
