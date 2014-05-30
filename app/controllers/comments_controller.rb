class CommentsController < ApplicationController

  # params = {topic_id: 234, post_id: 123, comment: {body: 'whatever'}}
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      redirect_to topic_post_path(@topic, @post), notice: "Comment was saved successfully."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render 'posts/show'
    end
    # @user = User.find(params[:user_id, :post_id])
    # @comment = current_user.comment.build(comment_params)
    # @comment.user = @user
  end


  #  private

  # def post_params
  #   params.require(:post, :user).permit(:body, :avatar)
  # end

end