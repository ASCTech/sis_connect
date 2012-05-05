require 'bundler/capistrano'
load 'deploy'
load 'deploy/assets'

set :keep_releases, 11

set :use_sudo, false
set :application, "sis_connect"

set :deploy_to, "/var/www/apps/#{application}"

set :scm, :git
set :repository,  "git@github.com:ASCTech/sis_connect.git"
set :branch, 'master'
set :deploy_via, :remote_cache

set :user, 'deploy'
set :ssh_options, { :forward_agent => true, :port => 2200 }

task :staging do
  role :app, "ruby-test.asc.ohio-state.edu"
  role :web, "ruby-test.asc.ohio-state.edu"
  role :db,  "ruby-test.asc.ohio-state.edu", :primary => true
  set :rails_env, 'staging'
end

before "deploy:assets:precompile" do
  run ["ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"].join(" && ")
end

after 'deploy', 'deploy:cleanup'
