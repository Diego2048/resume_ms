# -*- encoding : utf-8 -*-
Newresume::Admin.controllers :users do

  get :index do
    @title = mt(:user)
    @users = User.page(params[:page])
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
      params[:save_and_continue] ? redirect(url(:users, :new)) : redirect(url(:users, :show, :id => @user.id))
    else
      @title = pat(:create_title, :model => mt(:user))
      flash.now[:error] = pat(:create_error, :model => mt(:user))
      render 'users/new'
    end
  end

  get :show, :map => '/users/:id' do
    @title = pat(:show_title, :model => "#{mt(:user)} #{params[:id]}")
    @user = User.find(params[:id])
    render 'users/show'
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "#{mt(:user)} #{params[:id]}")
    @user = User.find(params[:id])
    render 'users/edit'
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "#{mt(:user)} #{params[:id]}")
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = pat(:update_success, :model => mt(:user), :id =>  "#{params[:id]}")
      params[:save_and_continue] ?
        redirect(url(:users, :index)) :
        redirect(url(:users, :edit, :id => @user.id))
    else
      flash.now[:error] = pat(:update_error, :model => mt(:user))
      render 'users/edit'
    end
  end

  delete :destroy, :with => :id do
    @title = mt(:user)
    user = User.find(params[:id])
    if user.destroy
      flash[:success] = pat(:delete_success, :model => mt(:user), :id => "#{params[:id]}")
    else
      flash[:error] = pat(:delete_error, :model => mt(:user))
    end
    redirect url(:users, :index)
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
