module ApplicationHelper

  def show_logged_in
    if user_signed_in?
      render 'shared/logged_in_user'
    else
      render 'shared/sign_buttons'
    end
  end

  def create_an_event
    render 'shared/create_an_event' if user_signed_in?
  end

  def show_alert
    render 'shared/alert' if flash[:error]
  end

  def show_notice
    render 'shared/notice' if flash[:success]
  end
end
