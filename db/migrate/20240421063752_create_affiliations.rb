class CreateAffiliations < ActiveRecord::Migration[7.0]
  def change
    create_table :affiliations do |t|
      t.string :name

      t.timestamps
    end

    create_table :person_affiliations do |t|
      t.references :person, null: false
      t.references :affiliation, null: false
    end

    create_table :person_locations do |t|
      t.references :person, null: false
      t.references :location, null: false
    end
  end

  
end
