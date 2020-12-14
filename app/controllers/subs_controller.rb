class SubsController < ApplicationController
    before_action :ensure_moderator, only:[:edit, :update]

    def new 
        @sub = Sub.new
        render :new 
    end

    def create 
        @sub = Sub.new(sub_params)
        if @sub.save 
            redirect_to subs_url
        else 
            flash.now[:errors] = @sub.errors.full_messages 
            render :new
        end
    end 

    def index
        @subs = Sub.all
        render :index
    end 

    def show 
        @sub = Sub.find_by(id: params[:subs][:id])
        render :show
    end 

    def edit 
        @sub = Sub.find_by(id: params[:sub][:id])
        render :edit
    end

    def update 
        @sub = Sub.find_by(id: params[:sub][:id])
        if @sub.update_attributes(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private 
    def sub_params 
        params.require(:sub).permit(:title, :description)
    end
end