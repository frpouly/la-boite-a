require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:sarkozy)
  end

  class PeopleControllerTestNotLoggedInTest < PeopleControllerTest
    test "should get index" do
      get people_url
      assert_response :success
    end

    test "should redirect to sign in" do
      get new_person_url
      assert_response :redirect
    end

    test "should not create person" do
      assert_difference("Person.count", 0) do
        post people_url, params: { person: { name: "Mélenchon" } }
      end

      assert_response :redirect
    end

    test "should show person" do
      get person_url(@person)
      assert_response :success
    end

    test "should not get edit when not logged" do
      get edit_person_url(@person)
      assert_response :redirect
    end

    test "should not update person" do
      patch person_url(@person), params: { person: { name: "New name" } }
      assert_equal(@person.name, "Nicolas Sarkozy")
      assert_redirected_to new_user_session_url
    end

    test "should not destroy person when not logged in" do
      assert_difference("Person.count", 0) do
        delete person_url(@person)
      end

      assert_redirected_to new_user_session_url
    end
  end
end
