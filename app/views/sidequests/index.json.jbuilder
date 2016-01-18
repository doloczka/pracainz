json.array!(@sidequests) do |sidequest|
  json.extract! sidequest, :id, :teacher_id, :level, :content, :challenger_id, :challenger_answer, :recipient, :recipient_answer
  json.url sidequest_url(sidequest, format: :json)
end
