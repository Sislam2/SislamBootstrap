require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  it_behaves_like "SharedCrudController"
end
