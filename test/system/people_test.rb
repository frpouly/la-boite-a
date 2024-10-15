require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @person = people(:sarkozy)
    sign_in users(:bob)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "La boîte à..."
  end

  test "should create person" do
    visit new_person_url

    fill_in "person_name", with: "Michel"
    attach_file "person_picture", File.absolute_path("./test/fixtures/files/sarkozy.jpg")
    click_on "Create Person"

    assert_text "Person was successfully created"
  end

  test "should update Person" do
    visit edit_person_url(@person)

    fill_in "person_name", with: "Michel"
    click_on "Update Person"

    assert_text "Person was successfully updated"
  end
end
