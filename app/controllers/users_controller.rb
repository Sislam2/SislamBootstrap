class UsersController < CrudController
  # before_action :check_hierarchy, only: [:create, :update]

  def create
    create! do
      @user.add_role(user_params[:role_name], current_account) if @user.errors.blank?
      redirect_to_button
    end
  end

  def update
    @user = User.find(params[:id])
    if !@user.has_cached_role?(user_params[:role_name], current_account)
      @user.roles.where(resource: current_account).destroy_all
      @user.add_role(user_params[:role_name], current_account)
    end
    update!{ redirect_to_button }
  end

  private
    INDEX_COLUMNS = [:email, :last_sign_in_at, :created_at]
    SEARCH_COLUMNS = [:email_cont]

    def user_params
      params.require(:user).permit(*form_permit_params)
    end

    # Remove a ligação direta com a conta
    def begin_of_association_chain; end

    # def check_hierarchy
    #   return if Account.where(id: current_account).with_roles(hierarchy_biggest(params[:role_name]), current_user).blank?
    # end
    #
    # # Get Hierarchy that could be add this role for other users # this method will be move to other class
    # def hierarchy_biggest(role_name)
    #   [role_name]
    # end
end
