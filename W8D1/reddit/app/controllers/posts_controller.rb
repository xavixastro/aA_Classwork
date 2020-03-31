class PostsController < ApplicationController

    before_action :require_login, only: [:create]
    before_action :require_author, only: [:update, :edit]

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to sub_url(@post.sub)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def show
        @post = Post.find(params[:id])

        render :show
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id)
    end

    def require_author
        post = Post.find(params[:id])
        redirect_to post_url(post) if current_user.id != post.author.id
    end

end
