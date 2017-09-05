class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		#this post is NOT A CREATED POST
		#this is like a dummy object that we need to keep in memory
		#for form_for to use so it can better build the form html
	end

	def create
  	@post = Post.new(post_params(:title, :description))
  	@post.save
  	redirect_to post_path(@post)
	end

	def update
  	@post = Post.find(params[:id])
  	@post.update(post_params(:title))
  	redirect_to post_path(@post)
	end
	
	def edit
	  @post = Post.find(params[:id])
	end

	private

	def post_params(*args)
		params.require(:post).permit(*args)
	end
end
