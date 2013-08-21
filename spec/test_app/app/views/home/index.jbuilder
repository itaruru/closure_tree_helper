json.data do
  json.id 1
  json.name 'test'
  json.tags tree_json(@tags, {columns: ['id', 'name', 'created_at']})
end