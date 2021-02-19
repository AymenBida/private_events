class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @invited_users = User.where("users.username != '#{current_user.username}'").pluck(:username, :id)

  end

  def create
  end
end
