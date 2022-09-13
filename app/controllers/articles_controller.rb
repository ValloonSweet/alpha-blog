class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    debugger
    @article = Article.new(article_params)
    # @article.user = User.first
    respond_to do |format|
      if @article.save
        flash[:success] = "Article was successfully created"
        format.html { redirect_to article_path(@article) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
      end
    end
  end

  def edit
  end

  def update
    @article.user = User.first
    respond_to do |format|
      if @article.update(article_params)
        flash[:success] = "Article was successfully updated"
        format.html { redirect_to article_path(@article) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
      end
    end
  end

  def show
  end

  def destroy
    @article.destroy

    flash[:danger] = "Article was successfully deleted"
    redirect_to article_path, status: :see_other
  end

  private
    def set_article
      # here :id means path variable
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

end
