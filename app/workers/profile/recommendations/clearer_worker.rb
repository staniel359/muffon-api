class Profile
  module Recommendations
    class ClearerWorker < Worker::Base
      include Sidekiq::Throttled::Worker

      sidekiq_options queue: :profile

      sidekiq_throttle(
        concurrency: {
          limit: 1,
          key_suffix: ->(args) { JSON.parse(args)['profile_id'] }
        }
      )

      def perform(args)
        Muffon::Processor::Profile::Recommendations::Clearer.call(
          args_formatted(args)
        )
      end
    end
  end
end
