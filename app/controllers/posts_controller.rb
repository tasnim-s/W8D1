class PostsController < ApplicationController
    before_action :ensure_user, only:[:edit, :update]
    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to sub_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def destroy
        @post = Post.find(params[:id])
        if @post && @post.destroy
            redirect_to subs_url
        end
    end

    def edit
        render :edit
    end

    def update
        if @post.update_attributes(post_params)
            redirect_to sub_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    private
    def post_params
        params.require(:post).permit(:title)
    end

    def ensure_user
        @post = current_user.posts.find_by(id: params[:id])
        # @sub = current_user.id == @sub.moderator_id ? @sub : nil


        flash[:errors] = ["You aint the author"]
        redirect_to subs_url unless @post
    end
end