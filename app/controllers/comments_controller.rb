class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to tweets_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    if current_user.id == @comment.user.id
      @comment.destroy
      redirect_to tweet_path(params[:tweet_id])
    else
      redirect_to tweets_path
    end
      
  end
  
  private
      def comment_params
        params.require(:comment).permit(:body).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
      end
  
end
