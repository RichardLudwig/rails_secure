# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index search]

  # GET /articles
  # GET /articles.json
  def index
    @pagy, @articles = pagy(Article.all, items: 5)
  end

  def search
    # searches for articles with case-insensitive search query in article title, image, or content
    @articles = Article.where('title ILIKE ? OR image ILIKE ? OR content ILIKE ?', '%' + params[:q] + '%', '%' + params[:q] + '%', '%' + params[:q] + '%')
    @pagy, @articles = pagy(@articles, items: 5)

    # if no articles found for search query, redirect to articles index
    redirect_to articles_url if @articles.empty?
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :content, :image, :q)
  end
end
