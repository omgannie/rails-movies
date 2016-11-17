class CommentsController < ApplicationController

	def new
		authenticate!
		respond_to do |format|
			format.html
			format.js
  		end
	end

	def create
		authenticate!

		@comment = Comment.new(comment_params)

		if @comment.save
			respond_to do |format|
				format.html { redirect_to comment_params[:review].movie }
				format.js
			end
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
