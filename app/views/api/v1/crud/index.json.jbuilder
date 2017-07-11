json.total_count 1
json.incomplete_results false
json.items do
  json.array! collection do |obj|
    json.id obj.id
    json.text obj.to_s
  end
end
