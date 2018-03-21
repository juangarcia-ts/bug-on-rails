require 'test_helper'

class UserTest < ActiveSupport::TestCase  
  def setup
    @user = User.new(email: "user@example.com", username: "example-user")
  end

  # Email não pode ser nulo
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  # Email deve ser único
  test "email addresses should be unique" do
    @user.username = "."
    duplicate_user = @user.dup
    duplicate_user.save
    assert_not duplicate_user.valid?
  end

  # Nome de usuário não pode ser nulo
  test "username should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end

  # Nome de usuário não deve ultrapassar 20 caracteres
  test "username should not be too long" do
    @user.username = "." * 21
    assert_not @user.valid?
  end

  # Nome de usuário deve ser único
  test "username should be unique" do
    @user.email = "user@example.net"
    duplicate_user = @user.dup
    duplicate_user.save
    assert_not duplicate_user.valid?
  end

end
