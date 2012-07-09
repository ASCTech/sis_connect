source 'http://rubygems.org'

gem 'rails', '3.1.3'

gem 'sqlite3', :group => [:test, :development]

gem 'json'
gem 'active_sis', :git => 'git@github.com:ASCTech/active_sis.git'
#gem 'active_sis', :path => '../active_sis'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :production, :staging do
  gem 'ruby-oci8', '~> 2.0.6'
  gem 'activerecord-oracle_enhanced-adapter', '~> 1.4.0'
  gem 'mysql2'
end

