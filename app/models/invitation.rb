class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :host, class_name: 'User', foreign_key: 'host_id'
  belongs_to :attendee, class_name: 'User', foreign_key: 'attendee_id'
end
