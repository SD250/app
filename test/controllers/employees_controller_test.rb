require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get reserve" do
    get employees_reserve_url
    assert_response :success
  end
end
