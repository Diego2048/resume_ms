# -*- encoding : utf-8 -*-
Newresume::Admin.controllers :experiences, :parent => :user do
  before do
    @user = User.find params[:user_id]
  end

  post :create do
    @experience = Experience.new(experience_params)
    @experience.user = @user
    if @experience.save
      flash[:success] = pat(:create_success, :model => mt(:experience))
      redirect(url(:users, :show, id: @user.id))
    else
      flash.now[:error] = pat(:create_error, :model => mt(:experience))
      render '/users/show'
    end
  end

  get :edit, with: :id, provides: :html do
    @experience = Experience.find params[:id]
    render 'experiences/edit', layout: false
  end

  put :update, with: :id do
    @experience = Experience.find(params[:id])
    if @experience.update_attributes(experience_params)
      flash[:success] = pat(:update_success, model: mt(:experience), id:  "#{params[:id]}")
      redirect url(:users, :show, id: @user.id)
    else
      flash.now[:error] = pat(:update_error, model: mt(:experience))
      render 'users/show'
    end
  end

  delete :destroy, with: :id, provides: :json do
    experience = Experience.find_by_id(params[:id])
    if experience && !experience.destroy
      {success: false, msg: pat(:delete_error, :model => mt(:experience))}.to_json
    else
      {success: true}.to_json
    end
  end

end
