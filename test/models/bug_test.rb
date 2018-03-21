require 'test_helper'

class BugTest < ActiveSupport::TestCase
  def setup
    @bug = Bug.new(title: "Bug example", description: "My description")
  end

  # Título não pode ser nulo
  test "title should be present" do
    @bug.title = "     "
    assert_not @bug.valid?
  end

  # Título não deve ultrapassar 30 caracteres
  test "title should not be too long" do
    @bug.description = "." * 31
    assert_not @bug.valid?
  end

  # Descrição não pode ultrapassar 120 caracteres
  test "description should be unique" do
    @bug.description = "." * 121
    assert_not @bug.valid?
  end
end
