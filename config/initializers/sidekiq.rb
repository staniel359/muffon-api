require 'sidekiq/throttled'

Sidekiq::Throttled.setup!

Sidekiq.strict_args!
