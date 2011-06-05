class CommentsController < ApplicationController

  def create
    @comment = Comment.new(:post_id => params[:post_id], :body => params[:body])
    post = @comment.post
    if current_user
      @comment.user = current_user
    end
    if @comment.save
      flash[:notice] = 'Your comment was created.'
    else
      flash[:notice] = 'Comment was not created.'
    end
    redirect_to(user_post_path(post.user, post))
  end

  def show
    post = Post.find(params[:post_id])
    #здесь заглушка
    redirect_to(user_post_path(post.user, post))
  end

end
