module Recommendations
  class CreatorWorker
    include Sidekiq::Worker
    include Sidekiq::Throttled::Worker

    sidekiq_options queue: :recommendations_creator

    sidekiq_throttle(
      concurrency: {
        limit: 1,
        key_suffix: ->(args) { args['profile_id'] }
      }
    )

    def perform(args)
      Muffon::Profile::Recommendations::Creator.call(
        args.deep_symbolize_keys
      )
    end
  end
end
