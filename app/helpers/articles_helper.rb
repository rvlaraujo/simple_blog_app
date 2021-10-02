module ArticlesHelper
  def article_creator(user)
    user.nil? ? 'Post without an creator' : user.email
  end

  def article_comment_info(comment)
    @user = User.find(comment.user_id)
    "#{@user.email}, in #{comment.created_at.strftime('%a, %d %b %Y %H:%M:%S')}"
  end
end
