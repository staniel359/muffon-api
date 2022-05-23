class Artist
  module Image
    class UpdaterWorker < Worker::Base
      include Sidekiq::Throttled::Worker

      sidekiq_options queue: :artist_image

      sidekiq_throttle(
        concurrency: {
          limit: 1
        }
      )

      def perform(args)
        Muffon::Processor::Artist::Image::Updater.call(
          args_formatted(args)
        )
      end
    end
  end
end
