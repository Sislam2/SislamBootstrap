# Extend for this controller if you wanted create a crud controller
class CrudController < ApplicationController
  inherit_resources

  helper_method :form_params, :index_columns, :search_columns, :t_action_name

  add_breadcrumb ->(a){  a.page_title }, :collection_path
  add_breadcrumb :t_action_name

  def create
    create!{ redirect_to_button }
  end

  def update
    update!{ redirect_to_button }
  end

  private
    def redirect_to_button
      return if resource.new_record?
      case params[:button]
      when "save_and_keep" then
        edit_resource_path(resource)
      when "save_and_new" then
        new_resource_path
      else
        collection_path
      end
    end

    def form_params
      self.resource_class.form_fields
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
      t("views.#{controller_name}.#{action_name}", default: t("helpers.controller_actions.#{action_name}", default: action_name.camelize))
    end

    def begin_of_association_chain
      current_account
    end

    def form_permit_params
     self.resource_class.accept_fields
    end

    def map_permit_param(attributte)
      if attributte.is_a?(Hash)
        key = attributte.keys.first
        key.to_s.end_with?('attributes') ? map_attributes_params(attributte) : key
      elsif attributte.is_a?(Array)
        attributte.collect{|a| map_permit_param(a) }
      else
        attributte
      end
    end

    def map_attributes_params(attributte)
      { attributte.keys.first => attributte.values.map{|a| map_permit_param(a) }.flatten }
    end

end
