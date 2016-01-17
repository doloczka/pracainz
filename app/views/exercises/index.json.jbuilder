json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :lesson_id, :number, :reward, :story, :content, :hint
  json.url exercise_url(exercise, format: :json)
end
