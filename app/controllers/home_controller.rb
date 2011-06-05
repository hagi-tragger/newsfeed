class HomeController < ApplicationController

  def index
    @posts = Post.top.page(params[:page]).per(5)
    @show_top_only = true
  end

  def uncover
    @post = Post.find(params[:id])
    @full_text = true
  end

end
