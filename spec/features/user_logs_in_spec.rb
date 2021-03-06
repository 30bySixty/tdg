require "rails_helper"

feature "User signs in" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit user_session_path
  end

  scenario "with valid credentials" do
    
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password

    click_button "Log in"

    expect(page).to have_content("Logged in as")
  end

  scenario "with incorrect email" do

  	fill_in "user_email", with: 'xx'
  	fill_in "user_password", with: @user.password
  	expect(current_path).to eq(user_session_path)
  end

  scenario "with incorrect password" do

  	fill_in "user_email", with: @user.email
  	fill_in "user_password", with: 'xx'
  	expect(current_path).to eq(user_session_path)
  end
end