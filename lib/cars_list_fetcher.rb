class CarsListFetcher

  def self.update_all_from url="http://www.craa.dk/races/tilmeldte-koerere/"
    agent = Mechanize.new
    page = agent.get(url)
    page.search("//table[@class='drivers-table']//tr").each do |row|
      unless row.text.include?("Navn")
        begin
          race_car = RaceCar.create!(
            start_no: row.xpath("./td[3]").text, 
            class_type: row.xpath("./td[2]").text, 
            make: row.xpath("./td[5]").text, 
            model: row.xpath("./td[6]").text, 
            year: row.xpath("./td[7]").text, 
            ccm: row.xpath("./td[8]").text
          )
          Driver.create!(full_name: row.xpath("./td[1]").text, country: row.xpath("./td[4]").text, race_car: race_car)
        rescue
          next
        end
      end
    end
  end
end