require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/scm/git'

install_plugin Capistrano::SCM::Git

require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'

require 'capistrano/puma'

install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Systemd

require 'capistrano/sidekiq'

install_plugin Capistrano::Sidekiq
install_plugin Capistrano::Sidekiq::Systemd

require 'whenever/capistrano'

Dir.glob('lib/capistrano/tasks/*.rake').each do |task|
  import(task)
end
