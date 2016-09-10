require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should not get new when not logged in" do
    get events_new_path
    assert_response :redirect
  end
end
