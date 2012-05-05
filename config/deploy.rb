require 'bundler/capistrano'
load 'deploy'
load 'deploy/assets'

set :keep_releases, 11

set :use_sudo, false
set :application, "sis_connect"
set :sub_uri, ''

set :deploy_to, "/var/www/apps/#{application}"

set :scm, :git
set :repository, "git@github.com:ASCTech/sis_connect.git"
set :branch, 'master'
set :deploy_via, :remote_cache

set :user, 'deploy'
set :ssh_options, { :forward_agent => true, :port => 2200 }

task :staging do
  role :app, "ruby-test.asc.ohio-state.edu"
  role :web, "ruby-test.asc.ohio-state.edu"
  role :db,  "ruby-test.asc.ohio-state.edu", :primary => true
  set :rails_env, 'staging'
  set :sub_uri, application
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"

    # hit the server once, so the first user doesn't get a slow page load
    run "curl --insecure --silent https://localhost/#{sub_uri} > /dev/null"
  end

  task :seed, :roles => :app do
    run "cd #{current_path} && #{rake} RAILS_ENV=#{rails_env} db:seed"
  end
end

before "deploy:assets:precompile" do
  run ["ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"].join(" && ")
end

after 'deploy', 'deploy:cleanup'
