class User < ApplicationRecord
  has_many :events
  has_many :invitations
end
