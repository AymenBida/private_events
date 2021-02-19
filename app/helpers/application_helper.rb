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
    if current_user == event.user
      render 'shared/edit_event'
    end
  end
end
