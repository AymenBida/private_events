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

RSpec.feature 'Events' do
  before(:each) do
    @user = User.create(username: 'Test')
    current_user = @user
  end
  before(:each) do
    @event = @user.events.build(event_name: 'party', location: 'venue', time: '2021-02-27 14:21:00 UTC')
    @event.save
  end
  scenario 'when a user creates an event' do
    visit '/sessions/new'
    fill_in 'Username', with: 'Test'
    click_on 'Connect'
    click_on 'Create an event'
    fill_in 'Event name', with: 'party'
    fill_in 'Location', with: 'avenue'
    fill_in 'Time', with: '2021-02-27 15:00:00 UTC'
    click_on 'Create Event'
    expect(page).to have_content 'Event successfully created'
  end
  scenario 'when a user edits an event' do
    visit '/sessions/new'
    fill_in 'Username', with: 'Test'
    click_on 'Connect'
    visit '/users/1'
    click_on  'Show event'
    visit'/events/1/edit'
    fill_in 'Event name', with: 'party'
    fill_in 'Location', with: 'Menlo park'
    fill_in 'Time', with: '2021-02-27 15:00:00 UTC'
    click_on 'Edit Event'
    expect(page).to have_content 'Event successfully updated'
    
  end
end
