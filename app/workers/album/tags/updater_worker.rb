class Album
  module Tags
    class UpdaterWorker < Worker::Base
      sidekiq_options queue: :album_tags

      def perform(args)
        Muffon::Processor::Album::Tags::Updater.call(
          args_formatted(args)
        )
      end
    end
  end
end
