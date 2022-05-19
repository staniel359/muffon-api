class Artist
  module Image
    class UpdaterWorker < Worker::Base
      sidekiq_options queue: :artist

      def perform(args)
        Muffon::Processor::Artist::Image::Updater.call(
          args_formatted(args)
        )
      end
    end
  end
end
