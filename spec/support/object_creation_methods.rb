def create_post(overrides = {}, user = create_user)
  defaults = {
    title: "Best Post",
    content: "This is a post and is also the best around the block.",
    user_id: user.id
  }
  Post.create!(defaults.merge(overrides))
end

def create_user(overrides={})
  defaults = {user_name: "John", email: "john@example.com", password: "password"}
  User.create!(defaults.merge(overrides))
end
