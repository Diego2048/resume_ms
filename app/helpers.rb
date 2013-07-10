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


end
