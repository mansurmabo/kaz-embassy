json.array!(@events) do |event|
  json.extract! event, :id, :date
  json.title event.title + "\n" + event.site
  json.start event.date
end