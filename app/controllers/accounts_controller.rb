class AccountsController < CrudController
  private
    INDEX_COLUMNS = [:name]
    SEARCH_COLUMNS = [:name_cont]
    FORM_PARAMS = [:name]

    def account_params
      params.require(:account).permit(*FORM_PARAMS)
    end
    
    # Remove a ligação direta com a conta
    def begin_of_association_chain; end
end
