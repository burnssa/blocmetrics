json.array!(@events) do |event|
  json.extract! event, :id, :name, :location, :ip_address 
  json.url event_url(event, format: :json)
end