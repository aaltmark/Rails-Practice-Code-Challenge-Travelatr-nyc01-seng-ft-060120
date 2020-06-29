class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy, :add_like]

    def index 
        @posts = Post.all
    end

    def show 
    end 

    def add_like
      @post.add_like
      redirect_to post_path(@post)
    end
    

    def new
        @post = Post.new
    end 

    def create
      @post = Post.new(post_params)
      # @post.likes = 0
      if @post.save
        flash[:success] = "Post successfully created"
        redirect_to @post
      else
        flash[:errors] = @post.errors.full_messages
        redirect_to new_post_path
      end
    end

    def edit
    end 

    def update
       if @post.update(post_params) 
            redirect_to post_path(@post.id)
       else 
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path
       end
    end

    private

    def post_params
      params.require(:post).permit(:title, :content, :likes, :destination_id, :blogger_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end 
end
