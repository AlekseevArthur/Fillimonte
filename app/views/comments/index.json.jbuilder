json.array!(@comments) do |comment|
  json.comment_id comment.id
  json.text comment.text
  json.author comment.user.email
  json.canDelete(current_user&.id == comment.user.id)
end
