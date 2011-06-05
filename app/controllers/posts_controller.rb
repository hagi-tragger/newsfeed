class PostsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create]

  def all
    @posts = Post.rearrange.page(params[:page]).per(5)
    render_to_index
  end

  def index
    user = User.find(params[:user_id])
    @head_text = "Posts by #{user.name}"
    @posts = Post.by_user(user.id).rearrange.page(params[:page]).per(5)
    render_to_index
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(params[:post])
    if @post.save
      flash[:notice] = 'Your post was created.'
    else
      flash[:notice] = 'Post was not created.'
    end
    redirect_to(user_post_path(current_user, @post))
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.rearrange.page(params[:page]).per(5)
  end

  def show_by_category
    @head_text = "Category: " + Post.cat_name(params[:name])
    @posts = Post.by_cat(params[:name]).rearrange.page(params[:page]).per(5)
    render_to_index
  end
  
  def show_by_tag
    @head_text = "Tag: " + params[:name]
    @posts = Post.by_tag(params[:name]).rearrange.page(params[:page]).per(5)
    render_to_index
  end

  protected

  def render_to_index
    render :template => "home/index"
  end

end
