json.array!(@answers) do |answer|
  json.extract! answer, :id, :teacher_id, :student_id, :exercise, :content, :read
  json.url answer_url(answer, format: :json)
end
