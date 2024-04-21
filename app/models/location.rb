class Location < ApplicationRecord
  has_many :person_locations, dependent: :destroy,  class_name: "PersonLocation", foreign_key: :location_id, dependent: :destroy
  has_many :people, through: :person_locations

  validates_presence_of :name
end
