lock '~> 3.16.0'

set :application, 'muffon-api'
set :repo_url, 'git@github.com:staniel359/muffon-api.git'

set :branch, 'main'

set :deploy_to, '/root/muffon-api'

append :linked_files,
  'config/master.key',
  'config/credentials/production.yml.enc',
  'config/credentials/production.key'

append :linked_dirs,
  'log',
  'tmp/pids',
  'tmp/sockets',
  'public/temp/audio',
  'storage'

set :keep_releases, 2

set :rbenv_ruby, '3.0.3'

set :puma_bind, 'tcp://127.0.0.1:4000'
set :puma_service_unit_name, 'muffon'
set :puma_workers, 2

set :whenever_roles, -> { :app }

set :sidekiq_service_unit_user, :system

before 'deploy:check', 'creds:copy'

namespace :creds do
  desc 'Copy credentials'
  task :copy do
    on roles(:all) do |host|
      upload!(
        'config/credentials/production.yml.enc',
        '/root/muffon-api/shared/config/credentials/production.yml.enc'
      )
    end
  end
end
