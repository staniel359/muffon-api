class Artist
  module Tags
    class UpdaterWorker < Worker::Base
      sidekiq_options queue: :artist_tags

      def perform(args)
        Muffon::Processor::Artist::Tags::Updater.call(
          args_formatted(args)
        )
      end
    end
  end
end
