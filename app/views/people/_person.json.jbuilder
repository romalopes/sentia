json.extract! person, :id, :name, :species, :gender, :weapon, :vehicle, :created_at, :updated_at
json.url person_url(person, format: :json)
