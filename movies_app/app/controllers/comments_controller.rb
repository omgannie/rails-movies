class CommentsController < ApplicationController

	def new
		authenticate!
	end

	def create
		authenticate!

		@comment = Comment.new(comment_params)

		if @comment.save
			redirect_to comment_params[:review].movie
		else
			render 'new'
		end
	end

	def show
	end 

	private
  		def comment_params
    		params.require(:comment).permit(:body).merge({
    			author: authorized_user,
    			review: Review.find_by(id: params[:review_id])
    			})
  		end
end
