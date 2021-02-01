module SessionsHelper
  def nav_bar_buttons
    unless user_sign_in?
      @su_button = link_to 'REGISTER', new_user_path, class: 'text-decoration-none'
      @si_button = link_to 'LOGIN', login_path, class: 'text-decoration-none'
      @welcome = 'Connect first please'
      @pipe= "|"
    else
      @so_button = link_to 'LOGOUT', logout_path, class: 'text-decoration-none'
      @welcome = "Welcome #{current_user.name}!"
    end
  end
end
