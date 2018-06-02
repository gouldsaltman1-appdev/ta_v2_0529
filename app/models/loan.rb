require 'open-uri'
class Loan < ApplicationRecord
  before_validation :geocode_pickupdropoff_location

  def geocode_pickupdropoff_location
    if self.pickupdropoff_location.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.pickupdropoff_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.pickupdropoff_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.pickupdropoff_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.pickupdropoff_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :piece_of_equipment,
             :class_name => "Equipment",
             :foreign_key => "equipment_id",
             :counter_cache => true

  belongs_to :borrower,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  has_one    :owner,
             :through => :piece_of_equipment,
             :source => :owner

  # Validations

end
