json.array!(@articles) do |article|
  json.extract! article, :id
  json.title article.content
  json.start article.day
  json.end article.day
end