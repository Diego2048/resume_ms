# -*- encoding : utf-8 -*-
# Helper methods defined here can be accessed in any controller or view in the application

Newresume::App.helpers do
  # def simple_helper_method
  #  ...
  # end
end

Newresume::Admin.helpers do
  def account_params
    ActiveSupport::HashWithIndifferentAccess.new(params)
      .fetch(:account)
      .slice(:name, :surname, :email, :role, :password, :password_confirmation)
  end

  def user_params
    ActiveSupport::HashWithIndifferentAccess.new(params)
      .fetch(:user)
      .slice(:name, :gender, :birth_on_year, :birth_on_month, :work_on_year, :work_on_month, :degree, :email,
             :phone, :qq, :msn, :city, :address, :hukou, :family_tel, :company, :title, :industry, :website,
             :self_intro, :score, :source)
  end

  def experience_params
    ActiveSupport::HashWithIndifferentAccess.new(params)
      .fetch(:experience)
      .slice(:company, :industry, :department, :begin_on_year, :begin_on_month, :end_on_year, :end_on_month, :title,
             :summary)
  end

  def project_params
    ActiveSupport::HashWithIndifferentAccess.new(params)
      .fetch(:project)
      .slice(:name, :begin_on_year, :begin_on_month, :end_on_year, :end_on_month, :summary, :duty, :platform)
  end

  def short_date(date)
    I18n.l(date, :format => :ym) if date
  end

  def locale_abbr(obj, attribute, abbr_attr = nil)
    a = obj.send abbr_attr.nil? ? attribute : abbr_attr
    I18n.t("options.#{attribute}_names").at(a) if a
  end

end
