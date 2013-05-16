set :rvm_type, :system
require 'rvm/capistrano'

require 'bundler/capistrano'

set :application, 'Matrix-HQ'
set :deploy_to,   "/var/www/#{application}"
set :deploy_via,  :remote_cache
set :user, 'root'

set :scm, :git
set :repository,  'git@github.com:storkvist/Matrix-HQ.git'
set :ssh_options, { forward_agent: true }
set :repository_cache, 'git_cache'

role :web, 'matrix2.mgup.ru'
role :app, 'matrix2.mgup.ru'
role :db,  'matrix2.mgup.ru', :primary => true

set :normalize_asset_timestamps, false

before 'deploy:restart', 'deploy:migrate'
after 'deploy:restart', 'deploy:cleanup'

namespace :deploy do
  namespace :assets do
    task :precompile, roles: :app, except: { no_release: true } do
      run <<-CMD.compact
        cd -- #{latest_release.shellescape} &&
        #{rake} RAILS_ENV=#{rails_env.to_s.shellescape} #{asset_env} assets:precompile
      CMD
    end
  end

  task :start do ; end
  task :stop do ; end
  task :restart, roles: :app, except: { no_release: true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end