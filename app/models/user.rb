class User < ApplicationRecord
  has_many :events
  has_many :invitations, foreign_key: "host_id", class_name: 'invitation'
  has_many :invitations, foreign_key: "attendee_id", class_name: 'invitation'
end
