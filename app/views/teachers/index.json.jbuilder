json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :lastname, :login, :password_digest, :email
  json.url teacher_url(teacher, format: :json)
end
