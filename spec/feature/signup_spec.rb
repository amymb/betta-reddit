require 'rails_helper'
  feature "Signup" do
    scenario "Users can signup" do

      visit root_path

      click_link "Sign Up"
      expect(page).to have_content("Sign up for Betta Reddit")

      fill_in :user_user_name, with: 'Test User'
      fill_in :user_email, with: 'test@test.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'

      click_button 'Sign Up'

      expect(current_path).to eq root_path
      expect(page).to have_content('Test User')

    end
  end
