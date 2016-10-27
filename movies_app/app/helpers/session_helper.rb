module SessionHelper
  def authorized_user
    @auth_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    return true if authorized_user
  end

  def authenticate!
    redirect_to '/users/new' unless logged_in?
  end

  def unauthorized
    redirect_to '/401' unless authorized_user.trusted_reviewer
  end
end
