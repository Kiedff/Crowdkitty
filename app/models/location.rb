class Location < ActiveRecord::Base
  has_many :projects

  def self.for_autocomplete(search_term)
    Location.select("locations.id, locations.name as value").where("(locations.name != '' or locations.name is not null) and locations.name ilike :search_term", search_term: "%#{search_term}%")
  end
end
