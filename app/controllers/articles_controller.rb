class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all

    respond_to do |format|
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  def show
    respond_to do |format|
      format.json { render json: @article }
    end
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    response = {}
    response[:json] = @article
    response[:status] = @article.save ? :created : :unprocessable_entity

    respond_to do |format|
      format.json { render response }
    end
  end

  # PATCH/PUT /articles/1
  def update
    response = {}
    response[:json] = @article
    response[:status] = @article.update(article_params) ? :ok : :unprocessable_entity

    respond_to do |format|
      format.json { render response }
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:name, :description, :amount_cents)
    end
end
