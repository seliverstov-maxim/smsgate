module AuthHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    !current_user.guest?
  end

  def api_authenticate!
    raise ApiAuthException unless current_user.admin?
  end

  def authenticate_admin!
    unless current_user.admin?
      redirect_to new_session_path
    end
  end

  def authenticate_user!
    unless signed_in?
      redirect_to new_session_path(from: request.url)
    end
  end

  def current_user
    @current_user ||= session[:user_id] && User.active.find(session[:user_id]) ||
      Guest.new
  end

  def admin?(user)
    user.admin
  end
end