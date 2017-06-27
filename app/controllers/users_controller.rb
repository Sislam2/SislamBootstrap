class UsersController < CrudController
  private
    INDEX_COLUMNS = [:email, :last_sign_in_at, :created_at]
    SEARCH_COLUMNS = [:email_cont]
    FORM_PARAMS = [:email, :password, :password_confirmation]

    def user_params
      params.require(:user).permit(*FORM_PARAMS)
    end
end
