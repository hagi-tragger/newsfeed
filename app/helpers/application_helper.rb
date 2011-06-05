module ApplicationHelper

  def post_comments_count(post)
    post.comments.count.to_s + " comment".pluralize
  end

end
