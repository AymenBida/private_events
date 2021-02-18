module ApplicationHelper

  def show_logged_in
    if user_signed_in?
      render 'shared/logged_in_user'
    else
      render 'shared/sign_buttons'
    end
  end
end
