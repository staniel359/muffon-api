module Muffon
  module Utils
    class Image
      module Processing
        def process_image(image_file)
          Muffon::Processor::Image::Creator.call(
            image_args(
              image_file
            )
          )
        end

        def process_image_later(image_file)
          Muffon::Worker::Image::Creator.call(
            worker_image_args(
              image_file
            )
          )
        end

        def process_images(image_files)
          Muffon::Processor::Images::Creator.call(
            images_args(
              image_files
            )
          )
        end

        private

        def image_args(image_file)
          {
            **base_args,
            image_file:
          }
        end

        def base_args
          {
            model:,
            model_id: id
          }
        end

        def model
          self.class.name
        end

        def worker_image_args(image_file)
          {
            **base_args,
            profile_id:,
            image_file:
          }
        end

        def images_args(image_files)
          {
            **base_args,
            image_files:
          }
        end
      end
    end
  end
end
