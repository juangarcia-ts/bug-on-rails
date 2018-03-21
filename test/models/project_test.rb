require 'test_helper'

class ProjectTest < ActiveSupport::TestCase  
  def setup
    @project = Project.new(name: "Project example", short_description: "My description")
  end

  # Nome não pode ser nulo
  test "name should be present" do
    @project.name = "     "
    assert_not @project.valid?
  end

  # Nome não deve ultrapassar 30 caracteres
  test "title should not be too long" do
    @project.name = "." * 31
    assert_not @project.valid?
  end

  # Descrição não pode ser nula
  test "description should be present" do
    @project.short_description = "     "
    assert_not @project.valid?
  end

  # Descrição não pode ultrapassar 150 caracteres
  test "description should not be too long" do
    @project.short_description = "." * 151
    assert_not @project.valid?
  end
end
