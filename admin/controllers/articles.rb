Admin.controllers :articles do

  get :index do
    @articles = Article.all
    render 'articles/index'
  end

  get :new do
    @article = Article.new
    render 'articles/new'
  end

  post :create do
    @article = Article.new(params[:article])
    if (@article.save rescue false)
      flash[:notice] = 'Article was successfully created.'
      redirect url(:articles, :edit, :id => @article.id)
    else
      render 'articles/new'
    end
  end

  get :edit, :with => :id do
    @article = Article[params[:id]]
    render 'articles/edit'
  end

  put :update, :with => :id do
    @article = Article[params[:id]]
    if @article.modified! && @article.update(params[:article])
      flash[:notice] = 'Article was successfully updated.'
      redirect url(:articles, :edit, :id => @article.id)
    else
      render 'articles/edit'
    end
  end

  delete :destroy, :with => :id do
    article = Article[params[:id]]
    if article.destroy
      flash[:notice] = 'Article was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Article!'
    end
    redirect url(:articles, :index)
  end
end
