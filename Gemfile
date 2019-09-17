source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 5.0'
gem 'turbolinks', '~> 5'

# TODO: Update this to the next release once they release next version of jbuilder (something > 2.9.1)
gem 'jbuilder', github: 'rails/jbuilder', branch: 'master' # https://github.com/rails/rails/issues/35505

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap'
gem 'jquery-rails'
gem 'popper_js'
gem 'tether-rails'
gem 'jquery-ui-rails'
gem 'acts_as_list'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry'

  # TODO: remove this dependency when next version of rspec-rails is released (4.0)
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails', branch: '4-0-dev'
  # http://jessehouse.com/blog/2019/06/19/actionview-template-error-wrong-number-of-arguments-given-2/

  gem 'factory_bot_rails'
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara'
  gem 'launchy'
end
