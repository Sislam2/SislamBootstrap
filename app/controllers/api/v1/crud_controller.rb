class Api::V1::CrudController < ::CrudController
  inherit_resources
  respond_to :json
  layout false
end
