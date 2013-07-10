Newresume::Admin.controllers :accounts do

  get :index do
    @title = t('models.account.name')
    @accounts = Account.all
    render 'accounts/index'
  end

  get :new do
    @title = pat(:new_title, model: t('models.account.name'))
    @account = Account.new
    render 'accounts/new'
  end

  post :create do
    @account = Account.new(account_params)
    if @account.save
      @title = pat(:create_title, model: "#{t('models.account.name')} #{@account.id}")
      flash[:success] = pat(:create_success, model: t('models.account.name'))
      params[:save_and_continue] ? redirect(url(:accounts, :index)) : redirect(url(:accounts, :edit, id: @account.id))
    else
      @title = pat(:create_title, model: t('models.account.name'))
      flash.now[:error] = pat(:create_error, model: t('models.account.name'))
      render 'accounts/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, model: "#{t('models.account.name')} #{params[:id]}")
    @account = Account.find(params[:id])
    if @account
      render 'accounts/edit'
    else
      flash[:warning] = pat(:create_error, model: t('models.account.name'), id: "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, model: "#{t('models.account.name')} #{params[:id]}")
    @account = Account.find(params[:id])
    if @account
      if @account.update_attributes(account_params)
        flash[:success] = pat(:update_success, model: t('model.account.name'), id:  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:accounts, :index)) :
          redirect(url(:accounts, :edit, id: @account.id))
      else
        flash.now[:error] = pat(:update_error, model: t('models.account.name'))
        render 'accounts/edit'
      end
    else
      flash[:warning] = pat(:update_warning, model: t('models.account.name'), id: "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = t('models.account.name')
    account = Account.find(params[:id])
    if account
      if account != current_account && account.destroy
        flash[:success] = pat(:delete_success, model: t('models.account.name'), id: "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, model: t('models.account.name'))
      end
      redirect url(:accounts, :index)
    else
      flash[:warning] = pat(:delete_warning, model: t('models.account.name'), id: "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = t('models.account.name')
    unless params[:account_ids]
      flash[:error] = pat(:destroy_many_error, model: t('models.account.name'))
      redirect(url(:accounts, :index))
    end
    ids = params[:account_ids].split(',').map(&:strip).map(&:to_i)
    accounts = Account.find(ids)
    
    if accounts.include? current_account
      flash[:error] = pat(:delete_error, model: t('models.account.name'))
    elsif Account.destroy accounts
    
      flash[:success] = pat(:destroy_many_success, model: t('models.account.name'), :ids => "#{ids.to_sentence}")
    end
    redirect url(:accounts, :index)
  end
end
