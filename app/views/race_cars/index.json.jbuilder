json.array!(@race_cars) do |race_car|
  json.extract! race_car, :id, :start_no, :class_type, :make, :model, :year, :ccm, :hp, :description
  json.url race_car_url(race_car, format: :json)
end
