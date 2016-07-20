json.array!(@smsrequests) do |smsrequest|
  json.extract! smsrequest, :id, :mobile, :message
  json.url smsrequest_url(smsrequest, format: :json)
end
