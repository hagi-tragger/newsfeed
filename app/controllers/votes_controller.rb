class VotesController < ApplicationController

  def create
    if current_user
      @new_vote = Vote.new(:post_id => params[:post_id], :value => params[:value], :user_id => current_user.id)
      old_vote = Vote.find_by_post_id_and_user_id(params[:post_id], current_user.id)
    else
      @new_vote = Vote.new(:post_id => params[:post_id], :value => params[:value], :ip => request.remote_ip)
      old_vote = Vote.find_by_post_id_and_ip(params[:post_id], request.remote_ip)
    end
    if old_vote.nil?
      @new_vote.save
    else
      @new_vote = nil
    end
    @post = Post.find(params[:post_id])
  end

end
