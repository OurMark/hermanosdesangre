json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :ong_id, :objective, :progress, :active, :start, :end
  json.url challenge_url(challenge, format: :json)
end
