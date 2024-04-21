class PersonAffiliation < ApplicationRecord
  belongs_to :person, class_name: "Person", foreign_key: "person_id", dependent: :destroy
  belongs_to :affiliation
end
