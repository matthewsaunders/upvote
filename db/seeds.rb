user1 = User.create(email: "test@gmail.com", password: "qqqqqq", password_confirmation: "qqqqqq")
user2 = User.create(email: "test2@gmail.com", password: "qqqqqq", password_confirmation: "qqqqqq")

posts = [
  ["A website with a questionable future", "https://www.yahoo.com/"],
  ["A search engine that tracks your every move", "https://www.google.com/"],
]

posts.each do |title, link|
  Post.create(title: title, link: link, user: user1)
end

comments = [
  ["I agree. Questinable indeed!"]
]
