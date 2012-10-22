Admin.controllers :topics do

  get :index do
    @topics = Topic.all
    render 'topics/index'
  end

  get :new do
    @topic = Topic.new
    render 'topics/new'
  end

  post :create do
    @topic = Topic.new(params[:topic])
    if (@topic.save rescue false)
      flash[:notice] = 'Topic was successfully created.'
      redirect url(:topics, :edit, :id => @topic.id)
    else
      render 'topics/new'
    end
  end

  get :edit, :with => :id do
    @topic = Topic[params[:id]]
    render 'topics/edit'
  end

  put :update, :with => :id do
    @topic = Topic[params[:id]]
    if @topic.modified! && @topic.update(params[:topic])
      flash[:notice] = 'Topic was successfully updated.'
      redirect url(:topics, :edit, :id => @topic.id)
    else
      render 'topics/edit'
    end
  end

  delete :destroy, :with => :id do
    topic = Topic[params[:id]]
    if topic.destroy
      flash[:notice] = 'Topic was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Topic!'
    end
    redirect url(:topics, :index)
  end
end
