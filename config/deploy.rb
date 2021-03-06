# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'spreadhere'
set :repo_url, 'git@github.com:ggomagundan/spread_here.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', '.env' )

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :deploy_via, :remote_cache

set :default_env, { path: "/home/deployer/.rbenv/versions/2.3.0/lib/ruby/gems:/home/deployer/.rbenv/versions/2.3.0/bin:$PATH" }


# For DelayedJob And Mailer
set :delayed_job_workers, 2
set :delayed_job_roles, [:app, :background]


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

 before 'deploy:assets:precompile', :link_assets
 task :link_assets do
    on roles(:app), :roles => :app, :except => { :no_release => true } do
#      execute("ln -fs #{shared_path}/mongoid.yml #{release_path}/config/mongoid.yml")
      execute("ln -fs #{shared_path}/uploads #{release_path}/public/uploads")
#      execute("ln -fs #{shared_path}/database.yml #{release_path}/config/database.yml")

    end
  end

  task :restart_unicorn do
    on roles(:app), in: :sequence, wait: 8 do

      execute("cp #{shared_path}/unicorn.rb  #{fetch :current_deploy_path}/config/unicorn.rb")
      execute("cd #{fetch :current_deploy_path}")
      execute("service spread_here force-restart")

    end
  end

 after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

 after :published, 'actionjob:restart' do
   Rake::Task["delayed_job:restart"].reenable
 end

 after :published, 'link_vector_monitoring' do
   on roles(:app), in: :sequence, wait: 8 do
     execute("cp  -rf #{shared_path}/vector #{release_path}/public/vector")
   end
 end

  #after 'deploy:publishing', :restart_unicorn
  #after 'deploy:finishing', 'whenever:start'

end
