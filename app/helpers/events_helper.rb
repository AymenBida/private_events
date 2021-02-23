module EventsHelper
  def check_user_attending(event, past = nil)
    attending = event.invitations.where(user_id: current_user.id)
    return if past

    if attending.empty?
      render '/events/user_not_att', event: event
    else
      render '/events/user_attending', event: event
    end
  end

  def colspan_index(past)
    if past
      1
    else
      2
    end
  end
end
