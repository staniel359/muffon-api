# config valid for current version and patch releases of Capistrano
lock '~> 3.16.0'

set :application, 'muffon-api'
set :repo_url, 'git@github.com:staniel359/muffon-api.git'

# Default branch is :master
set :branch, 'main'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/root/muffon-api'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files,
  'config/master.key',
  'config/credentials/production.yml.enc',
  'config/credentials/production.key'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/sockets', 'public/temp/audio'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 2

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :rbenv_ruby, '3.0.1'

set :puma_bind, 'tcp://127.0.0.1:4000'
set :puma_service_unit_name, 'muffon'
set :puma_workers, 2
