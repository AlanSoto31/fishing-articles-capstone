module SessionsHelper
  def nav_bar_buttons
    if user_sign_in?
      @article = link_to 'ARTICLE', new_fishing_path, class: 'text-decoration-none'
      @so_button = link_to 'LOGOUT', logout_path, class: 'text-decoration-none'
      @welcome = "Welcome #{current_user.name}!"
    else
      @su_button = link_to 'REGISTER', new_user_path, class: 'text-decoration-none'
      @si_button = link_to 'LOGIN', login_path, class: 'text-decoration-none'
    end
  end
end
