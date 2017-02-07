
posts = [
  ["A website with a questionable future", "https://www.yahoo.com/"],
  ["A search engine that tracks your every move", "https://www.google.com/"],
]

posts.each do |title, link|
  Post.create(title: title, link: link)
end
