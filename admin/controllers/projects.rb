# -*- encoding : utf-8 -*-
Newresume::Admin.controllers :projects, :parent => :user do
  before do
    @user = User.find params[:user_id]
  end

  post :create do
    @project = Project.new(project_params)
    @project.user = @user
    if @project.save
      flash[:success] = pat(:create_success, :model => mt(:project))
      redirect(url(:users, :show, id: @user.id))
    else
      flash.now[:error] = pat(:create_error, :model => mt(:project))
      render '/users/show'
    end
  end

  get :edit, with: :id, provides: :html do
    @project = Project.find params[:id]
    render 'projects/edit', layout: false
  end

  put :update, with: :id do
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = pat(:update_success, model: mt(:project), id:  "#{params[:id]}")
      redirect url(:users, :show, id: @user.id)
    else
      flash.now[:error] = pat(:update_error, model: mt(:project))
      render 'users/show'
    end
  end

  delete :destroy, with: :id, provides: :json do
    project = Project.find_by_id(params[:id])
    if project && !project.destroy
      {success: false, msg: pat(:delete_error, :model => mt(:project))}.to_json
    else
      {success: true}.to_json
    end
  end

end
