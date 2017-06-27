# Extend for this controller if you wanted create a crud controller
class CrudController < ApplicationController
  inherit_resources

  helper_method :form_params, :index_columns, :search_columns

  private
    def form_params
      self.class::FORM_PARAMS
    end

    def index_columns
      self.class::INDEX_COLUMNS
    end

    def search_columns
      self.class::SEARCH_COLUMNS
    end

  protected
   def collection
     get_collection_ivar || set_collection_ivar(search_ransack.page(params[:page]))
   end

   def search_ransack
    @q = end_of_association_chain.ransack(params[:q])
    @q.result
   end

end
