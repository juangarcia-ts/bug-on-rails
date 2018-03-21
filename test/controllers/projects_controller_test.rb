require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    #Criação de um usuário autenticado ao projeto      
    @user = User.create(id: 1,
                        email: "user@example.com", 
                        password: "password")     
  end

  #Deve apresentar o index ao usuário logado
  test "should get index" do
    sign_in(@user) # Login do usuário

    get user_projects_url(@user.id, @project.id)
    assert_response :found
  end  

  #Deve apresentar o form de novo projeto
  test "should get new" do
    sign_in(@user) # Login do usuário
    get new_user_project_url(@user.id, @project.id)
    assert_response :success
  end

  #####################################
  ## Daqui para baixo não funciona.  ##
  ## Problema com criação de um usuá-##
  ## rio que logue no sistema.       ##
  #####################################
  test "should create project" do
    assert_difference('Project.count') do
      post user_projects_url(@project.user_id, @project.id), params: { project: { short_description: "MyDescription3", name: "MyString3", user_id: @user.id } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get user_project_url(@user.id, @project.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_project_url(@user.id, @project.id)
    assert_response :success
  end

  test "should update project" do    
    patch user_project_url(@user.id, @project.id), params: { project: { short_description: @project.description, name: @project.name, user_id: @project.user_id } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete user_project_url(@user.id, @project.id)
    end

    assert_redirected_to projects_url
  end
end
