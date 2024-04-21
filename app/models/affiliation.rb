class Affiliation < ApplicationRecord
  has_many :person_affiliations, dependent: :destroy,  class_name: "PersonAffiliation", foreign_key: :affiliation_id, dependent: :destroy
  has_many :peoople, through: :person_affiliations


  validates_presence_of :name  
end
