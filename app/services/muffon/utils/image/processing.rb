module Muffon
  module Utils
    class Image
      module Processing
        def process_image(image_file)
          Muffon::Processor::Image::Creator.call(
            **base_args,
            image_file:
          )
        end

        def process_image_later(image_file)
          # FileUtils.mkdir_p(
          #   "tmp/sidekiq/images"
          # )

          # file =
          #   ::File.new(
          #     "tmp/sidekiq/images/#{SecureRandom.uuid}",
          #     'wb'
          #   )

          # file.write(
          #   image_file
          # )

          # file.rewind

          Muffon::Worker::Image::Creator.call(
            **base_args,
            profile_id:,
            image_file:
          )
        end

        def process_images(image_files)
          Muffon::Processor::Images::Creator.call(
            **base_args,
            image_files:
          )
        end

        private

        def base_args
          {
            model: self.class.name,
            model_id: id
          }
        end
      end
    end
  end
end
