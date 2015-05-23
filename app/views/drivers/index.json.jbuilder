json.array!(@drivers) do |driver|
  json.extract! driver, :id, :full_name, :country
  json.url driver_url(driver, format: :json)
end
