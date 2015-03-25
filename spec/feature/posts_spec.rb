require 'rails_helper'
feature 'Posts CRUD' do
  scenario 'anyone can see a list of all posts on the index' do

    create_post

    visit root_path

    expect(page).to have_content("Todays Posts")

    expect(page).to have_content("Best Post")
    expect(page).to have_content("This is a post and is also the best around the block.")

  end

  scenario 'signed in user can create posts' do
    visit root_path
    click_on "Create Post"

    expect(page).to have_content "Sign up to create a post!"

    sign_in_user
    click_on "Create Post"
    fill_in "Title", with: "Title"
    fill_in "Content", with: "Content is content for post title"

    click_on "Create Post"

    expect(current_path).to eq root_path
    expect(page).to have_content("Title")
    expect(page).to have_content("Content is content for post title")
  end

  scenario 'signed in user can update post' do
    post = create_post
    sign_in_user

    expect(current_path).to eq root_path

    click_on "Best Post"
    expect(page).to have_content("Best Post")
    click_on "Edit"
    fill_in "Title", with: "Better Post"
    fill_in "Content", with: "This is an update"

    click_on "Update Post"

    expect(current_path).to eq post_path(post)
    expect(page).to have_content("Better Post")
    expect(page).to have_content("This is an update")
  end

#  scenario 'signed in user can delete post' do

end
