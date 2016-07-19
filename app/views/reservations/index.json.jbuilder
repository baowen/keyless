json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :customername, :location, :roomnumber, :startdatetime, :enddatetime, :pinnumber, :mobile, :cleanername, :roomtype
  json.url reservation_url(reservation, format: :json)
end
