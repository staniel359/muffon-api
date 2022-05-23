class Profile
  module Recommendations
    module Recommendation
      class CreatorWorker < Worker::Base
        include Sidekiq::Throttled::Worker

        sidekiq_options queue: :profile_recommendations

        sidekiq_throttle(
          concurrency: {
            limit: 5,
            key_suffix: ->(args) { JSON.parse(args)['profile_id'] }
          }
        )

        def perform(args)
          Muffon::Processor::Profile::Recommendation::Creator.call(
            args_formatted(args)
          )
        end
      end
    end
  end
end
