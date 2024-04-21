require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "import people" do
    Person.destroy_all
    Person.import_people
  end
end
