module PostsHelper
  def current_user_post?(post)
     post.user == current_user
  end
end
