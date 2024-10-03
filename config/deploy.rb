lock '~> 3.19.1'

set :application, 'muffon-api'

set :repo_url,
  "git@github.com:staniel359/#{fetch(:application)}.git"

set :branch, 'main'

set :deploy_to, "/root/#{fetch(:application)}"

append :linked_files,
  'config/master.key',
  'config/credentials/production.yml.enc',
  'config/credentials/production.key',
  'invalid_requests.csv',
  'lib/spotify/cookies.txt',
  'lib/vk/downloader'

append :linked_dirs,
  'log',
  'tmp/pids',
  'tmp/sockets',
  'public/media'

set :keep_releases, 1

set :rbenv_ruby, File.read(
  '.ruby-version'
).strip

set :puma_service_unit_name, fetch(:application)
set :puma_systemctl_user, :system
set :puma_workers, 1

set :nginx_config_name, fetch(:application)
set :nginx_server_name,
  '178-79-138-81.ip.linodeusercontent.com'
set :nginx_use_ssl, true
set :nginx_ssl_certificate,
  "/etc/letsencrypt/live/#{fetch(:nginx_server_name)}/fullchain.pem"
set :nginx_ssl_certificate_key,
  "/etc/letsencrypt/live/#{fetch(:nginx_server_name)}/privkey.pem"

set :sidekiq_service_unit_user, :system
set :sidekiq_user, :root

set :whenever_roles, -> { :app }

before 'deploy:check:linked_files', 'config:copy'

namespace :config do
  desc 'Copy config'
  task :copy do
    on roles(:all) do |host|
      upload!(
        'config/credentials/production.yml.enc',
        "/root/#{fetch(:application)}/shared/config/credentials/production.yml.enc"
      )

      # upload!(
      #   'lib/spotify/cookies.txt',
      #   "/root/#{fetch(:application)}/shared/lib/spotify/cookies.txt"
      # )

      # upload!(
      #   'lib/vk/downloader',
      #   "/root/#{fetch(:application)}/shared/lib/vk/downloader"
      # )
    end
  end
end
