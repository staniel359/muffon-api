class Track
  module Tags
    class UpdaterWorker < Worker::Base
      sidekiq_options queue: :track_tags

      def perform(args)
        Muffon::Processor::Track::Tags::Updater.call(
          args_formatted(args)
        )
      end
    end
  end
end
