def sign_in_user
  User.create!(user_name: "John", email: "john@example.com", password: "password")
  visit sign_in_path
  fill_in :user_name, with: "John"
  fill_in :password, with: "password"
  click_on "Sign In"
end
