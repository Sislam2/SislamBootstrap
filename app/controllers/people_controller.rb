class PeopleController < CrudController
  private
    INDEX_COLUMNS = [:name, :email, :phone, :mobile_phone]
    SEARCH_COLUMNS = [:email_or_name_or_cpf_cnpj_cont]
    FORM_PARAMS = [{:email => {type: :email}}, :name, :address, :cep, {:phone => {type: :tel}}, {:mobile_phone => {type: :tel}}, :city_id, :cpf_cnpj]

    def user_params
      params.require(:person).permit(*FORM_PARAMS)
    end

    # Remove a ligação direta com a conta
    def begin_of_association_chain; end
end
