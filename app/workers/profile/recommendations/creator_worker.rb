class Profile
  module Recommendations
    class CreatorWorker < Worker::Base
      include Sidekiq::Throttled::Worker

      sidekiq_options queue: :profile_recommendations

      sidekiq_throttle(
        concurrency: {
          limit: 1,
          key_suffix: ->(args) { JSON.parse(args)['profile_id'] }
        }
      )

      def perform(args)
        Muffon::Processor::Profile::Recommendations::Creator.call(
          args_formatted(args)
        )
      end
    end
  end
end
