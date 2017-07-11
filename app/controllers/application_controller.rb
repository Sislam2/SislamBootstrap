class ApplicationController < ActionController::Base
  respond_to :html, :json

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :page_title

  protected
    def page_title
      t(controller_name.singularize, scope: 'activerecord.models').pluralize
    end

    def current_account
      @current_account ||= Account.first
    end

end
