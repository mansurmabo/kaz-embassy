json.array!(@events) do |event|
  json.extract! event, :id, :date_st, :date_end
  json.title event.title + "\n" + event.site
  json.start event.date_st
  json.end event.date_end
  # json.repeats event.repeat
end