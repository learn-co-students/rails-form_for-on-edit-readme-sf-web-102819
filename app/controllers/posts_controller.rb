class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		#we can't use strong params here because require(:post) looks for a :post key but there is none in the params. This is because we haven't created a post yet
	  @post = Post.new
		# byebug
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end
	# def create
	#   @post = Post.new
	#   @post.title = params[:title]
	#   @post.description = params[:description]
	#   @post.save
	#   redirect_to post_path(@post)
	# end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  # @post.update(title: params[:title], description: params[:description])
	  @post.update(post_params(:title, :description))
	  redirect_to post_path(@post)
	end
	# def update
	#   @post = Post.find(params[:id])
	#   @post.update(params.require(:post).permit(:title, :description))
	#   #.require excapsulates title and description within a post hash
	#   redirect_to post_path(@post)
	# end

	private

	def post_params(*args)
		params.require(:post).permit(*args)
	end
end