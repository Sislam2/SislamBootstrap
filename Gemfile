source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
#use framerwork bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# use for controller actions
gem 'inherited_resources'
# Use for beatefully HTML
gem "slim"
# Use fontawsome icons
gem 'font-awesome-sass', '~> 4.7.0'
# use for authentication
gem 'devise'
# use for permissons
gem "rolify"
# use for easy controller responders
gem "responders"
# use for flahs notifications using toast
gem 'toastr_rails'
# use for easy Attachment
gem 'paperclip'
# use for search
gem 'ransack'
# use for paginate
gem 'kaminari'
# use for custom forms DSL
gem 'simple_form'
# use for dynamic nested forms
gem 'nested_form_fields'
# use for breadcrumbs
gem "breadcrumbs_on_rails"
# use for logical delete
gem "paranoia"
# use AWS SDK
gem 'aws-sdk', '~> 2'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Use for awsome production logs
gem "lograge"
# Use for application errors
gem 'rollbar'

# Use for mask on input fields -> Jquery Mask https://igorescobar.github.io/jQuery-Mask-Plugin/
gem 'jquery_mask_rails'
# Use for Select2
gem "select2-rails", '~> 4.0.3'

# Use Admin-Lte
source 'https://rails-assets.org' do
  gem 'rails-assets-adminlte'
  gem 'rails-assets-jquery-icheck'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'pry-nav'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem "simplecov"
  gem 'rails-controller-testing'
end

group :development do
  gem "slim-rails"
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Use for generate annotation about Databse on model
  gem 'annotate'
  # Use to cacth queris N+1 problem!
  gem 'bullet'
  # Use for code police
  gem 'rubocop'
  # Use for open email on tab
  gem 'letter_opener'
end
