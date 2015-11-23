class PostsController < ApplicationController

	before_action :find_post, only: [:show,:edit,:update,:destroy]
	def index
	end
	
	 def new
	  @post = Post.new
	 end

	 def create
	 	@post = Post.new post_params

	 	if @post.save
	 		redirect_to @post, notice: "Post was successfully saved"
	 	else
	 	 render 'new', notice:"Post wasn't saved, please try again"	
	 	end
	 end

	 def show
	 end

	 def edit
	 end

	 def update
		 if @post.update post_params
		 	redirect_to @post, notice: "Your article was updated"
		 else
		 	render 'edit'
		 end	
	 end

	 def destroy
	 
	 end

	 private

	 def post_params
	 	params.require(:post).permit(:title,:content)
	 end

	 def find_post
	  @post = Post.find(params[:id])

	 end




end
