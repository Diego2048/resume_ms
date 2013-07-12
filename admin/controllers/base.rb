# -*- encoding : utf-8 -*-
Newresume::Admin.controllers :base do
  get :index, :map => "/" do
    render "base/index"
  end
end
