#========================
#CONFIG
#========================
set :application, "Screenshotter"
set :scm, :git
set :repository, "git@github.com:Crowd9/Screenshotter.git"
set :ssh_options, { :forward_agent => true }
set :user, "rails"
set :use_sudo, false
set :runner, "rails"
set :deploy_to, "/home/rails/#{application}"
set :app_server, :passenger
set :domain, "promozor.com"
#========================
#ROLES
#========================
role :app, domain
role :web, domain
role :db, domain, :primary => true
#========================
#CUSTOM
#========================
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
  task :stop, :roles => :app do
    # Do nothing.
  end
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end