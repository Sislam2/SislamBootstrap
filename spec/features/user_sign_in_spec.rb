require "rails_helper"

RSpec.feature "User managment own session", :type => :feature do
  # fixtures :users
  let(:user){ FactoryGirl.create(:user) }
  scenario "User creates a new session" do
    # sign_in user
    visit "/users/sign_in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => '123123123'
    click_button "Log in"

    expect(page).to have_text("Logado com sucesso.")
  end

  scenario "User destroy a new session" do
    sign_in user
    visit "/"
    click_link "Sign out"

    expect(page).to have_text("Você precisa fazer login ou se registrar, antes de continuar.")
  end

end
