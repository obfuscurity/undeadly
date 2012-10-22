Admin.controllers :states do

  get :index do
    @states = State.all
    render 'states/index'
  end

  get :new do
    @state = State.new
    render 'states/new'
  end

  post :create do
    @state = State.new(params[:state])
    if (@state.save rescue false)
      flash[:notice] = 'State was successfully created.'
      redirect url(:states, :edit, :id => @state.id)
    else
      render 'states/new'
    end
  end

  get :edit, :with => :id do
    @state = State[params[:id]]
    render 'states/edit'
  end

  put :update, :with => :id do
    @state = State[params[:id]]
    if @state.modified! && @state.update(params[:state])
      flash[:notice] = 'State was successfully updated.'
      redirect url(:states, :edit, :id => @state.id)
    else
      render 'states/edit'
    end
  end

  delete :destroy, :with => :id do
    state = State[params[:id]]
    if state.destroy
      flash[:notice] = 'State was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy State!'
    end
    redirect url(:states, :index)
  end
end
