class CommentsController < ApplicationController 
	before_action :require_user

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comments_params)
		@comment.post = @post
		

		if @comment.save
			flash[:notice] = "Your comment was saved."
			redirect_to post_path(@post)
		else
			render 'posts/show'
		end

	end

	def vote
		@comment = Comment.find(params[:id])
	    @vote = Vote.create(voteable: @comment, user_id: current_user.id, vote: params[:vote])
	    if @vote.valid? 
	      flash[:notice] = "Your vote was counted."
	    else
	      flash[:error] = "You can only vote once per post or comment."
	    end

	    redirect_to :back
  	end

	private

	def comments_params
		params.require(:comment).permit!
	end

end
