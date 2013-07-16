# -*- encoding : utf-8 -*-
Newresume::Admin.controllers :acquired_skills, :parent => :user do
  before do
    @user = User.find params[:user_id]
  end

  post :create do
    @acquired_skill = AcquiredSkill.new(acquired_skill_params)
    @acquired_skill.user = @user
    if @acquired_skill.save
      flash[:success] = pat(:create_success, :model => mt(:acquired_skill))
      redirect(url(:users, :show, id: @user.id))
    else
      flash.now[:error] = pat(:create_error, :model => mt(:acquired_skill))
      render '/users/show'
    end
  end

  get :edit, with: :id, provides: :html do
    @acquired_skill = AcquiredSkill.find params[:id]
    render 'acquired_skills/edit', layout: false
  end

  put :update, with: :id do
    @acquired_skill = AcquiredSkill.find(params[:id])
    if @acquired_skill.update_attributes(acquired_skill_params)
      flash[:success] = pat(:update_success, model: mt(:acquired_skill), id:  "#{params[:id]}")
      redirect url(:users, :show, id: @user.id)
    else
      flash.now[:error] = pat(:update_error, model: mt(:acquired_skill))
      render 'users/show'
    end
  end

  delete :destroy, with: :id, provides: :json do
    acquired_skill = AcquiredSkill.find_by_id(params[:id])
    if acquired_skill && !acquired_skill.destroy
      {success: false, msg: pat(:delete_error, :model => mt(:acquired_skill))}.to_json
    else
      {success: true}.to_json
    end
  end

end
