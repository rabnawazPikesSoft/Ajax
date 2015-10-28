json.array!(@blogs) do |blog|
  json.extract! blog, :id, :first_name, :last_name, :age
  json.url blog_url(blog, format: :json)
end
