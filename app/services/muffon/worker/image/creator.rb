module Muffon
  module Worker
    module Image
      class Creator < Muffon::Worker::Base
        def call
          check_args

          return if no_data?

          data
        end

        private

        def required_args
          %i[
            profile_id
            model
            model_id
          ]
        end

        def no_data?
          image_file.blank?
        end

        def image_file
          @args[:image_file]
        end

        def data
          limit_queue

          set_temp_image_file

          process_image
        end

        def limit_queue
          Sidekiq::Queue[queue].limit = 5
        end

        def queue
          "profile_image_#{@args[:profile_id]}"
        end

        def set_temp_image_file
          file =
            temp_image_file_stream

          file.write(
            image_file
          )

          file.rewind
        end

        def temp_image_file_stream
          ::File.new(
            temp_image_file_path,
            'wb'
          )
        end

        def temp_image_file_path
          @temp_image_file_path ||=
            "tmp/sidekiq/images/#{uuid_string}"
        end

        def process_image
          ::Image::CreatorWorker
            .set(
              queue:
            )
            .perform_async(
              worker_args_formatted
            )
        end

        def worker_args
          {
            model: @args[:model],
            model_id: @args[:model_id],
            temp_image_file_path:
          }
        end
      end
    end
  end
end
