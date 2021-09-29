module ArticlesHelper
  def article_creator(user)
    user.nil? ? 'Post without an creator' : user.email
  end
end
