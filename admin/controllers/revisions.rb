Admin.controllers :revisions do

  get :index do
    @revisions = Revision.all
    render 'revisions/index'
  end

  get :new do
    @revision = Revision.new
    render 'revisions/new'
  end

  post :create do
    @revision = Revision.new(params[:revision])
    if (@revision.save rescue false)
      flash[:notice] = 'Revision was successfully created.'
      redirect url(:revisions, :edit, :id => @revision.id)
    else
      render 'revisions/new'
    end
  end

  get :edit, :with => :id do
    @revision = Revision[params[:id]]
    render 'revisions/edit'
  end

  put :update, :with => :id do
    @revision = Revision[params[:id]]
    if @revision.modified! && @revision.update(params[:revision])
      flash[:notice] = 'Revision was successfully updated.'
      redirect url(:revisions, :edit, :id => @revision.id)
    else
      render 'revisions/edit'
    end
  end

  delete :destroy, :with => :id do
    revision = Revision[params[:id]]
    if revision.destroy
      flash[:notice] = 'Revision was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Revision!'
    end
    redirect url(:revisions, :index)
  end
end
