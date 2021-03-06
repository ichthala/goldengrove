source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.1.14.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'dotenv-rails'
gem 'jquery-rails'
gem 'backbone-on-rails'
gem 'twitter'
gem 'tweetstream'
gem 'omniauth-twitter'
gem 'foundation-rails'
gem 'haml-rails'
gem 'thin'
gem 'sass-rails'
gem 'coffee-rails'
gem 'handlebars_assets'
gem 'hamlbars'
gem 'active_model_serializers', :git => 'https://github.com/rails-api/active_model_serializers', :branch => 'master'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '>= 1.0.3'

group :production do
  gem 'pg'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'selenium-webdriver'
  gem 'timecop'
end

group :development, :test do
  gem 'sqlite3'
  gem 'teaspoon-jasmine'
  gem 'factory_girl_rails'
  gem 'pry-rails'           # Causes rails console to open pry
                            # https://github.com/rweng/pry-rails
  # gem 'pry-debugger'        # Adds step, next, finish, and continue commands and breakpoints
                            # https://github.com/nixme/pry-debugger
  # gem 'pry-stack_explorer'  # Navigate the call-stack
                            # https://github.com/pry/pry-stack_explorer
  gem 'annotate'            # Annotate all your models, tests, fixtures, and factories
                            # https://github.com/ctran/annotate_models
  gem 'quiet_assets'        # Turns off the Rails asset pipeline log
                            # https://github.com/evrone/quiet_assets
  # gem 'better_errors'       # Replaces the standard Rails error page with a much better and more useful error page
                            # https://github.com/charliesome/better_errors
  gem 'binding_of_caller'   # Advanced features for better_errors advanced features (REPL, local/instance variable inspection, pretty stack frame names)
                            # https://github.com/banister/binding_of_caller
  gem 'meta_request'        # Supporting gem for Rails Panel (Google Chrome extension for Rails development).
                            # https://github.com/dejan/rails_panel/tree/master/meta_request
  gem 'rails-erd'           # Diagrams your models. NOTE! $ brew install graphviz
                            # https://github.com/voormedia/rails-erd
  gem 'rspec-rails', '~> 3.0' # Rspec-rails is a testing framework for Rails 3.x and 4.x.
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
