class Artist
  module Tags
    class UpdaterWorker < Worker::Base
      include Sidekiq::Throttled::Worker

      sidekiq_options queue: :artist_tags

      sidekiq_throttle(
        concurrency: {
          limit: 1
        }
      )

      def perform(args)
        Muffon::Processor::Artist::Tags::Updater.call(
          args_formatted(args)
        )
      end
    end
  end
end
