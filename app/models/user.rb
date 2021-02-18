class User < ApplicationRecord
  has_many :events
  has_many :invitations, foreign_key: "host_id"
  has_many :invitations, foreign_key: "attendee_id"
end
