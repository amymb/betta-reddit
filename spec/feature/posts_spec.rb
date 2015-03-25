require 'rails_helper'
feature 'Posts CRUD' do
  scenario 'user can see a list of all posts on the index' do
    
    create_post

    visit root_path

    expect(page).to have_content("Todays Posts")

    expect(page).to have_content("Best Post")
    expect(page).to have_content("This is a post and is also the best around the block.")

  end


end
