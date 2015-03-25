require 'rails_helper'

feature 'signin' do
  scenario 'user can sign in' do
    User.create!(user_name: "Bruce Willis", email: "email@email.com", password: "password")
    visit root_path
    click_on "Sign In"

    fill_in :user_name, with: "Bruce Willis"
    fill_in :password, with: 'password'

    click_button 'Sign In'

    expect(current_path).to eq root_path
    expect(page).to have_content "Bruce Willis"
  end
end
