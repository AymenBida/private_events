require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe 'assosiations' do
    it 'belongs to one Event' do
      invitation = Invitation.reflect_on_association(:event)
      expect(invitation.macro).to eql(:belongs_to)
    end
    it 'belongs to one Attendee' do
      invitation = Invitation.reflect_on_association(:attendee)
      expect(invitation.macro).to eql(:belongs_to)
    end
  end
end
