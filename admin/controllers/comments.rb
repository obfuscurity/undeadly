Admin.controllers :comments do

  get :index do
    @comments = Comment.all
    render 'comments/index'
  end

  get :new do
    @comment = Comment.new
    render 'comments/new'
  end

  post :create do
    @comment = Comment.new(params[:comment])
    if (@comment.save rescue false)
      flash[:notice] = 'Comment was successfully created.'
      redirect url(:comments, :edit, :id => @comment.id)
    else
      render 'comments/new'
    end
  end

  get :edit, :with => :id do
    @comment = Comment[params[:id]]
    render 'comments/edit'
  end

  put :update, :with => :id do
    @comment = Comment[params[:id]]
    if @comment.modified! && @comment.update(params[:comment])
      flash[:notice] = 'Comment was successfully updated.'
      redirect url(:comments, :edit, :id => @comment.id)
    else
      render 'comments/edit'
    end
  end

  delete :destroy, :with => :id do
    comment = Comment[params[:id]]
    if comment.destroy
      flash[:notice] = 'Comment was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Comment!'
    end
    redirect url(:comments, :index)
  end
end
