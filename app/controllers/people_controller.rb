class PeopleController < CrudController
  def new
    new!{ resource.build_avatar; resource }
  end

  private
    INDEX_COLUMNS = [:name, :email, :phone, :mobile_phone]
    SEARCH_COLUMNS = [:email_or_name_or_cpf_cnpj_cont]

    def person_params
      params.require(:person).permit(form_permit_params)
    end

    def begin_of_association_chain
      current_account
    end
end
