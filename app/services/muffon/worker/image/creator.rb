module Muffon
  module Worker
    module Image
      class Creator < Muffon::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:model],
            @args[:model_id],
            @args[:image_file]
          ]
        end

        def data
          limit_queue

          process_image
        end

        def limit_queue
          Sidekiq::Queue[queue].limit = 5
        end

        def queue
          "profile_image_#{@args[:profile_id]}"
        end

        def process_image
          ::Image::CreatorWorker.set(
            queue:
          ).perform_async(
            worker_args
          )
        end

        def worker_args
          {
            model: @args[:model],
            model_id: @args[:model_id],
            image_file: @args[:image_file]
          }.to_json
        end
      end
    end
  end
end
