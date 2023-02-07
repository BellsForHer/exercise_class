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

    def edit
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(product_params)

        if @post.save
            flash[:notice] = "saved successfully"
            redirect_to @post
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(title: params[:post][:title], body: params[:post][:body])
            redirect_to post_path(@post)
            
        else
            render :edit, :status, :unprocessable_entity

        end
    end
end