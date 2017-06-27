# Extend for this controller if you wanted create a crud controller
class CrudController < ApplicationController
  inherit_resources

  helper_method :form_params, :index_columns, :search_columns, :t_action_name

  add_breadcrumb ->(a){  a.page_title }, :collection_path
  add_breadcrumb :t_action_name

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

   def t_action_name
     t("views.#{controller_name}.#{action_name}", default: action_name.camelize)
   end

end
