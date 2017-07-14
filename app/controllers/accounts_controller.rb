class AccountsController < CrudController
  private
    INDEX_COLUMNS = [:name]
    SEARCH_COLUMNS = [:name_cont]

    def account_params
      params.require(:account).permit(*form_permit_params)
    end

    # Remove a ligação direta com a conta
    def begin_of_association_chain; end
end
