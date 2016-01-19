json.array!(@students) do |student|
  json.extract! student, :id, :login, :password_digest, :email, :name, :lastname, :album_number, :authenticated, :group_id
  json.url student_url(student, format: :json)
end
