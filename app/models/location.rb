class Location < ActiveRecord::Base
  has_many :projects

  def self.for_autocomplete(search_term)
    Location.where("(locations.name != '' or locations.name is not null) and locations.name ilike :search_term", search_term: "%#{search_term}%").pluck(:name)
  end
end
