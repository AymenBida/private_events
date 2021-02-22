module ApplicationHelper
  def show_logged_in
    if user_signed_in?
      render 'shared/logged_in_user'
    else
      render 'shared/sign_buttons'
    end
  end

  def show_user_links
    render 'shared/user_links' if user_signed_in?
  end

  def show_alert
    render 'shared/alert' if flash[:error]
  end

  def show_notice
    render 'shared/notice' if flash[:success]
  end

  def show_edit_event(event)
    render 'shared/edit_event' if current_user == event.user
  end

  def show_my_invitations(events, title)
    if events.empty?
      render '/users/no_invitations', description: title
    else
      render '/users/my_invitations', events: events
    end
  end

  def show_my_events(user)
    if user.events.empty?
      render '/users/no_events'
    else
      render '/users/my_events', user: user
    end
  end

  def show_all_events(events, title)
    if events.empty?
      render '/events/no_events', description: title
    else
      render '/events/all_events', events: events, description: title.capitalize
    end
  end
end
