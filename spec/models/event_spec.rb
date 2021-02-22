require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'assosiations' do
    it 'belongs to one User' do
      event = Event.reflect_on_association(:user)
      expect(event.macro).to eql(:belongs_to)
    end
    it 'can have many invitations' do
      event = Event.reflect_on_association(:invitations)
      expect(event.macro).to eql(:has_many)
    end
  end
end
