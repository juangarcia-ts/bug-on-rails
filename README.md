# Bug on Rails

Site desenvolvido em Ruby on Rails para criação e gerenciamento de bugs em projetos e integração com o Slack através de um bot.
Proposto como desafio em um processo seletivo em Mar/2018.

## Como usar

  Clone o repositório
  ```
  git clone https://github.com/juangarcia-ts/bugonrails
  ```
  Entre no diretório
  ```
  cd bugonrails
  ```
  Instale as Gems
  ```
  bundle install
  ```
  Rode o servidor
  ```
  rails server
  ou
  rails s
  ```
  
### Funções Propostas

 * Cadastro, login, visualização, edição e exclusão de usuário.
 * Criação, visualização, edição e exclusão de projetos.
 * Criação, visualização e edição de um bug relacionado à um projeto, com um estado para que possa ser resolvido.
 * Ao se criar um bug ou resolvê-lo, deverá ocorrer uma notificação no canal do Slack, ao qual você foi convidado, com o estado e os dados relacionados a esse bug.
 
## Tecnologias e Técnicas Necessárias

 * [Ruby](https://www.ruby-lang.org/pt/)
 * [Ruby on Rails](http://rubyonrails.org/)
 * [Coffescript](http://coffeescript.org/)
 * [Sass](https://sass-lang.com/)
 * [Slim](https://github.com/slim-template/slim-rails)
 * [Bootstrap](https://github.com/twbs/bootstrap-sass)
 * [Formstatic](https://github.com/justinfrench/formtastic)
 * [Devise](https://github.com/plataformatec/devise)
 * [Slack-notifier](https://github.com/stevenosloan/slack-notifier)
