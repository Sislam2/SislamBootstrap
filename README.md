# SislamBootstrap
- Starter pack for a new app

**Layout Componentes:**

- AdminLTE (https://adminlte.io)
- InputMask Jquery ( email, tel, cep, cpf_cnpj ) (https://igorescobar.github.io/jQuery-Mask-Plugin/)
- Select2 (https://select2.github.io/)

**Libraries:**
  - slim
  - inherited_resources
  - font-awesome-sass
  - devise
  - rolify
  - responders
  - toastr_rails
  - paperclip
  - ransack
  - kaminari
  - simple_form
  - nested_form_fields
  - breadcrumbs_on_rails
  - paranoia
  - aws-sdk
  - lograge
  - rollbar
  - query_mask_rails
  - select2-rails

**Utilites**

CrudController (InheritedResource):

  This controller easy you to create a views without write views codes. You Just Need Extend you controller from CrudController. So you will use the templates app/views/crud/ to render views. If you want create your especific views just create
  ``` app/views/<name_of_your_controller>/<action_name>.slim  ```

Exemplo:

  Create new controller
  ```
  # app/controllers/people_controller.rb
  class PeopleController < CrudController
    private
      INDEX_COLUMNS = [:name, :email, :phone, :mobile_phone] # Columns that displayed on index action
      SEARCH_COLUMNS = [:email_or_name_or_cpf_cnpj_cont] # Filters that displayed on index filter forms
      FORM_PARAMS = [{:email => {type: :email}}, :name, :address, :cep, {:phone => {type: :tel}}, {:mobile_phone => {type: :tel}}, :city_id, :cpf_cnpj] # Columns That user could be assings on new, create, edit or update actions

      def user_params # Used for StrongParameters
        params.require(:person).permit(*FORM_PARAMS)
      end

      def begin_of_association_chain # use this if do you like associate this object with accout, note you need have the has_many people on Account model
        current_account
      end
  end

  ```

  Create testes for this controller
  ```
    #spec/app/controllers/people_controller_spec.rb
    require 'rails_helper'

    RSpec.describe PeopleController, type: :controller do
      it_behaves_like "SharedCrudController"
    end
  ```

Notifications (ActionCable)
  It's easyer, you just need create a notification.

  ``` Notification.create(recipient_id: User.first.id, message: 'you message') ```

- Menu (SideBar Menu)
- Roles (Rolify)
- User (Devise)
- Account (Model)
- Person (Model)

Select2
  init automatic for belongs_to fields add on FORM_PARAMS foreing_key value like city_id use:

  ``` FORM_PARAMS = [:city_id] ```

  So select2 will be request AJAX for api_v1_cities_path(format: :json).
  It's just create a API v1 Controller And Write method to_s on your Model:

  ```
  # app/controllers/api/v1/cities_controller.rb
  class Api::V1::CitiesController < Api::V1::CrudController
    private
      # Remove a ligação direta com a conta
      def begin_of_association_chain; end

      def search_ransack
        @q = end_of_association_chain.ransack(name_cont: params[:q])
        @q.result
      end
  end
  ```

  ```
  # app/models/city.rb
  class City < ApplicationRecord
    def to_s
      "#{name} - #{state} - #{country}"
    end
  end

  ```

  Or create your own controller and return JSON:
  ```
  {
    'total_count': 1,
    'incomplete_results': false
    'items': [{
      id: 1,
      text: 'London'
      }]
  }
  ```

Database Schema:


**Testes**
- capybara
- rspec
- factory_girl_rails
- simplecov
