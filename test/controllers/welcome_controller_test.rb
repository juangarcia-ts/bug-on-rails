require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  # Retornar página inicial
  test "should get index" do
    get welcome_path
    assert_response :success
  end
end
