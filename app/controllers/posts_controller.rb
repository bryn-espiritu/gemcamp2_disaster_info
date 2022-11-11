class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :validate_post_user, only: [:edit, :update, :destroy]


    def index
      def index
        @posts = Post.includes(:user, :categories).order(comments_count: :desc).kept.page(params[:page]).per(5)
        @hot_tag = Post.order(comments_count: :desc).limit(3).select { |post| post.comments_count >= 1 }

      end
    end

    def new
      @post = Post.new
      @random = sprintf'%04d', rand(-9999), unique: true
    end

  def short_url
    @post = Post.find_by(unique_num: params[:unique_num])
    redirect_to post_path(@post)
  end

    def create
      @post = Post.new(post_params)
      @post.user = current_user
      if Rails.env.development?
        @post.ip_address = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
      else
        @post.ip_address = request.remote_ip
      end
      if @post.save
        redirect_to posts_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def show; end

    def update
      if @post.update(post_params)
        redirect_to posts_path
      else
        render :edit
      end
    end

    def destroy
      if @post.comments_count >= 1
        flash[:notice] = "The post with comments can't be deleted."
      else
        @post.discard
      end
      redirect_to posts_path
    end

    private

    def post_params
      params.require(:post).permit(:title, :content, :address, :unique_num, category_ids: [])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def validate_post_user
      unless @post.user == current_user
        flash[:notice] = 'Post Error Unauthorized access'
        redirect_to post_path
      end
    end

end
