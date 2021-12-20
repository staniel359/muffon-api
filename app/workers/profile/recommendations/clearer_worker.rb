class Profile
  module Recommendations
    class ClearerWorker
      include Sidekiq::Worker
      include Sidekiq::Throttled::Worker

      sidekiq_options queue: :recommendations_clearer

      sidekiq_throttle(
        concurrency: {
          limit: 1,
          key_suffix: ->(args) { args['profile_id'] }
        }
      )

      def perform(args)
        Muffon::Processor::Profile::Recommendations::Clearer.call(
          args.deep_symbolize_keys
        )
      end
    end
  end
end
