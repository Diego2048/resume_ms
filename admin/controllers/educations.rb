# -*- encoding : utf-8 -*-
Newresume::Admin.controllers :educations, :parent => :user do
  before do
    @user = User.find params[:user_id]
  end

  post :create do
    @education = Education.new(education_params)
    @education.user = @user
    if @education.save
      flash[:success] = pat(:create_success, :model => mt(:education))
      redirect(url(:users, :show, id: @user.id))
    else
      flash.now[:error] = pat(:create_error, :model => mt(:education))
      render '/users/show'
    end
  end

  get :edit, with: :id, provides: :html do
    @education = Education.find params[:id]
    render 'educations/edit', layout: false
  end

  put :update, with: :id do
    @education = Education.find(params[:id])
    if @education.update_attributes(education_params)
      flash[:success] = pat(:update_success, model: mt(:education), id:  "#{params[:id]}")
      redirect url(:users, :show, id: @user.id)
    else
      flash.now[:error] = pat(:update_error, model: mt(:education))
      render 'users/show'
    end
  end

  delete :destroy, with: :id, provides: :json do
    education = Education.find_by_id(params[:id])
    if education && !education.destroy
      {success: false, msg: pat(:delete_error, :model => mt(:education))}.to_json
    else
      {success: true}.to_json
    end
  end

end
