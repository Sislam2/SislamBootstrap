class AccountsController < CrudController
  private
    INDEX_COLUMNS = [:name]
    SEARCH_COLUMNS = [:name_cont]
    FORM_PARAMS = [:name]

    def account_params
      params.require(:account).permit(*FORM_PARAMS)
    end
end
