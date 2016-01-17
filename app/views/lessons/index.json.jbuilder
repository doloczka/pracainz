json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :number, :teacher_id
  json.url lesson_url(lesson, format: :json)
end
