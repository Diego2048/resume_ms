Newresume::Admin.controllers :users do

  get :index do
    @title = mt(:user)
    @users = User.all
    render 'users/index'
  end

  get :new do
    @title = pat(:new_title, :model => mt(:user))
    @user = User.new
    render 'users/new'
  end

  post :create do
    @user = User.new(user_params)
    if @user.save
      @title = pat(:create_title, :model => "#{mt(:user)} #{@user.id}")
      flash[:success] = pat(:create_success, :model => mt(:user))
      params[:save_and_continue] ? redirect(url(:users, :index)) : redirect(url(:users, :edit, :id => @user.id))
    else
      @title = pat(:create_title, :model => mt(:user))
      flash.now[:error] = pat(:create_error, :model => mt(:user))
      render 'users/new'
    end
  end

  get :show, :map => '/users/:id' do
    @title = pat(:show_title, :model => "#{mt(:user)} #{params[:id]}")
    @user = User.find(params[:id])
    if @user
      render 'users/show'
    else
      flash[:warning] = pat(:create_error, :model => mt(:user), :id => "#{params[:id]}")
      halt 404
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "#{mt(:user)} #{params[:id]}")
    @user = User.find(params[:id])
    if @user
      render 'users/edit'
    else
      flash[:warning] = pat(:create_error, :model => mt(:user), :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "#{mt(:user)} #{params[:id]}")
    @user = User.find(params[:id])
    if @user
      if @user.update_attributes(user_params)
        flash[:success] = pat(:update_success, :model => mt(:user), :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:users, :index)) :
          redirect(url(:users, :edit, :id => @user.id))
      else
        flash.now[:error] = pat(:update_error, :model => mt(:user))
        render 'users/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => mt(:user), :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = mt(:user)
    user = User.find(params[:id])
    if user
      if user.destroy
        flash[:success] = pat(:delete_success, :model => mt(:user), :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => mt(:user))
      end
      redirect url(:users, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => mt(:user), :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = mt(:user)
    unless params[:user_ids]
      flash[:error] = pat(:destroy_many_error, :model => mt(:user))
      redirect(url(:users, :index))
    end
    ids = params[:user_ids].split(',').map(&:strip).map(&:to_i)
    users = User.find(ids)

    if User.destroy users
      flash[:success] = pat(:destroy_many_success, :model => mt(:user), :ids => "#{ids.to_sentence}")
    end
    redirect url(:users, :index)
  end
end
