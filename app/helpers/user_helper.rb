module UserHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def user_self_comment_lim80(user)
    return unless user.self_comment
    if user.self_comment.length <= 80
      user.self_comment
    else
      user.self_comment.truncate(80)
    end
  end

  def current_user?(user)
    user == current_user
  end

end
