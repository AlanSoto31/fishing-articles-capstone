module SessionsHelper
  def nav_bar_buttons
    unless user_sign_in?
      @su_button = link_to 'Sign Up', new_user_path, class: 'btn btn-info text-white'
      @si_button = link_to 'Log in', login_path, class: 'btn btn-info text-white'
      @welcome = 'Connect first please'
    else
      @so_button = link_to 'Log out', logout_path, class: 'btn btn-info text-white '
      @welcome = "Welcome #{current_user.name}!"
    end
  end
end
