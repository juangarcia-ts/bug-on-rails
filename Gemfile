source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.4'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# New gems
gem 'sass-rails', '>= 3.2'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'formtastic', '~> 3.0'
gem 'slim-rails'
gem 'devise'
gem 'html2slim'
gem 'slack-notifier'
gem 'rails-controller-testing'

group :development, :test do  
  gem 'byebug', platform: :mri
end

group :development do  
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'  
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby "2.3.1"
