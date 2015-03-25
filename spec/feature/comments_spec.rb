require 'rails_helper'
feature 'Comments CRUD' do
  scenario 'user can add comment to a post' do

    post = create_post
    visit root_path
    sign_in_user

    click_on "Best Post"
    expect(page).to have_content "Best Post"


    fill_in "Content", with: "This is a comment"
    click_on "Create Comment"

    expect(current_path).to eq post_path(post)
    expect(page).to have_content("This is a comment")
    expect(page).to have_content("John")


  end

  scenario 'user can edit comments' do
    post = create_post
    user = create_user
    comment = Comment.create!(content: "Shabang!", post_id: post.id, user_id: user.id)
    visit root_path
    sign_in_user

    click_on "Best Post"
    expect(page).to have_content "Best Post"

    click_on "Edit Comment"
    expect(current_path).to eq edit_post_comment_path(post.id, comment.id)

    fill_in "Content", with: "Shabang! I really mean it."

    click_on "Update Comment"

    expect(current_path).to eq post_path(post)
    expect(page).to have_content "Shabang! I really mean it."
  end

end
