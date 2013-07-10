source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'bcrypt-ruby', require: 'bcrypt'
gem 'erubis', '~> 2.7.0'
gem 'activerecord', '~> 4.0', require: 'active_record'
gem 'mysql2'

# Padrino Stable Gem
gem 'padrino', '0.11.2'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.11.2'
# end

group :development do
  gem 'pry-padrino'
  gem 'thin'
end

group :test do
  # Test requirements
  gem 'minitest', '~> 4.2', require: 'minitest/autorun'
  gem 'rack-test', require: 'rack/test'
  gem 'factory_girl'
  gem 'database_cleaner'
end