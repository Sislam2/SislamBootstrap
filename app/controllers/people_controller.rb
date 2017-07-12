class PeopleController < CrudController
  private
    INDEX_COLUMNS = [:name, :email, :phone, :mobile_phone]
    SEARCH_COLUMNS = [:email_or_name_or_cpf_cnpj_cont]
    FORM_PARAMS = [{:email => {type: :email}}, :name, :address, :cep, :cpf_cnpj,
      {:phone => {type: :tel}}, {:mobile_phone => {type: :tel}}, :city_id,
      {:avatar_attributes => [archive: {type: :file}]}]

    def person_params
      params.require(:person).permit(*form_permit_params)
    end

    def begin_of_association_chain
      current_account
    end
end
