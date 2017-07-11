class Api::V1::CitiesController < Api::V1::CrudController
  private
    # Remove a ligação direta com a conta
    def begin_of_association_chain; end

    def search_ransack
      @q = end_of_association_chain.ransack(name_cont: params[:q])
      @q.result
    end
end
