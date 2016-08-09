require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get help" do
    get help_url
    assert_response :success
  end

  test "should get contacts" do
    get contacts_url
    assert_response :success
  end

  test "should get logo in contacts" do
    get contacts_url
    assert_select '#logo'
  end

end
