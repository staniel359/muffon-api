module Muffon
  module Utils
    class Image
      module Processing
        def process_image(
          image_file
        )
          Muffon::Processor::Image::Creator.call(
            model: model_name.name,
            model_id: id,
            image_file:
          )
        end

        def process_image_later(
          image_file
        )
          Muffon::Worker::Image::Creator.call(
            profile_id:,
            model: model_name.name,
            model_id: id,
            image_file:
          )
        end

        def process_images(
          image_files
        )
          Muffon::Processor::Images::Creator.call(
            model: model_name.name,
            model_id: id,
            image_files:
          )
        end
      end
    end
  end
end
