class Artist
  module Tags
    class UpdaterWorker
      include Sidekiq::Worker
      include Sidekiq::Throttled::Worker

      sidekiq_options queue: :artist_tags_updater

      sidekiq_throttle(
        concurrency: {
          limit: 1
        }
      )

      def perform(args)
        Muffon::Processor::Artist::Tags::Updater.call(
          args.deep_symbolize_keys
        )
      end
    end
  end
end
