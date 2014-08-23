json.array!(@badges) do |badge|
  json.extract! badge, :id, :name, :value, :icon, :description
  json.url badge_url(badge, format: :json)
end
