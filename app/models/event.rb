class Event < ApplicationRecord
  belongs_to :user
  has_many :invitations

  scope :past_events, -> { where("time < :now", now: DateTime.now) }
  scope :future_events, -> { where("time >= :now", now: DateTime.now) }
end
