json.array!(@messages) do |message|
  json.extract! message, :id, :subject, :content, :read, :sender, :recipient
  json.url message_url(message, format: :json)
end
