json.array! @posts do |post|
  json.id post.id
  json.title post.title
  json.content post.content
  json.category post.category
end