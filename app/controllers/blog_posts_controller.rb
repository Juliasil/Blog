class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, except: [:index, :new, :create]
  before_action :set_locale


  def index
    @blog_posts = BlogPost.order(created_at: :desc)
  end

  def search
    @blog_posts = BlogPost.search(search_params[:q])
  end

  def show
    @comments = @blog_post.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post, notice: 'O post foi criado com  sucesso.'
    else
      flash.now[:alert] = @blog_post.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.comments.destroy_all
    @blog_post.destroy
    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :author, :body)
  end

  def search_params
    params.permit(:q)
  end

  def set_blog_post
    @blog_post = BlogPost.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end
end