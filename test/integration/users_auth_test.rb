require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "successful user sign up" do
    # Ir até a página de cadastro
    get new_user_registration_path
    # Garantir que haja mais um usuário após o POST
    assert_difference 'User.count' do
      post user_registration_path, params: { 
                                        user: 
                                          { 
                                            email: "user@email.com",
                                            username: "user123",
                                            password: "password",
                                            password_confirmation: "password" 
                                          } 
                                      }
    end
    assert_response :redirect
  end

  test "wrong password user sign up" do
    # Ir até a página de cadastro
    get new_user_registration_path
    # Garantir que haja mais um usuário após o POST
    assert_no_difference 'User.count' do
      post user_registration_path, params: { 
                                        user: 
                                          { 
                                            email: "user@email.com",
                                            username: "user123",
                                            password: "foo",
                                            password_confirmation: "bar" 
                                          } 
                                      }
    end
  end

  test "wrong email user sign up" do
    # Ir até a página de cadastro
    get new_user_registration_path
    # Garantir que haja mais um usuário após o POST
    assert_no_difference 'User.count' do
      post user_registration_path, params: { 
                                        user: 
                                          { 
                                            email: "user123",
                                            username: "user123",
                                            password: "password",
                                            password_confirmation: "password" 
                                          } 
                                      }
    end
  end

  ############################
  ## Não está funcionando.  ##          
  ## Problema na criação do ##
  ## usuário.               ##
  ############################
  test "user sign in" do
    # Ir até a página de login
    get new_user_session_path
    # Criar usuário
    @user = User.new(email: "user@example.com", password: "password")
    # Entrar com os dados
    post user_registration_path, params: { 
                                      user: 
                                        { 
                                          email: @user.email,
                                          password: @user.password
                                        } 
                                    }
    assert_response :redirect
  end
end
