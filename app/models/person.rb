class Person < ApplicationRecord
  has_many :person_locations, dependent: :destroy,  class_name: "PersonLocation", foreign_key: :person_id, dependent: :destroy
  has_many :locations, through: :person_locations

  has_many :person_affiliations, dependent: :destroy,  class_name: "PersonAffiliation", foreign_key: :person_id, dependent: :destroy
  has_many :affiliations, through: :person_affiliations

  validates_presence_of :first_name, :species, :gender 


  def self.split_name(current_name)
    index_name = current_name.index(" ")
    if index_name
      first_name = current_name[0, index_name]
      last_name = current_name[index_name, current_name.size]
    else 
      first_name = current_name
    end
    return first_name, last_name
  end

  # Person.import_people
  def self.import_people(file_path = "#{Rails.root.to_s}/Sentia Coding Test Data.csv")
    
    total_imported, total_found = 0, 0

    csv_data = Roo::CSV.new(file_path)

    csv_data.each_with_index do |value, index_data|
      next if index_data == 0

      puts "value:#{value}"
      i = -1

      first_name, last_name = split_name(value[i+=1])
      locations = value[i+=1]
      location_array = locations.split(',')
      species = value[i+=1] || ""
      gender = value[i+=1]
      gender = (gender.present? && gender.size > 0) ? gender[0].capitalize : "O" 
      affiliations = value[i+=1]
      
      next if affiliations.nil? || affiliations.empty?
      affiliations_array = affiliations.split(',')
      weapon = value[i+=1]
      vehicle = value[i+=1]

      person = Person.find_or_create_by(first_name: first_name, last_name: last_name, species: species, gender: gender, weapon:weapon, vehicle: vehicle)
      if person.new_record?
        total_imported += 1
      else
        total_found += 1
      end

      location_array.each do |location_name|
        location = Location.find_or_create_by(name: location_name)
        person.locations << location unless person.locations.where(name: location.name).first
      end

      affiliations_array.each do |affiliation_name|
        affiliation = Affiliation.find_or_create_by(name: affiliation_name)
        person.affiliations << affiliation unless person.affiliations.where(name: affiliation.name).first
      end
      # person.save!
    end
    return total_imported, total_found
  end
end
