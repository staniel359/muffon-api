module Muffon
  module Utils
    module ImageProcessing
      def process_image(image_file)
        return if image_file.blank?

        image.purge

        return if image_file == 'DELETED'

        image.attach(
          **image_file_data_formatted(
            image_file
          )
        )
      end

      def process_images(image_files)
        images.purge

        image_files&.each do |i|
          images.attach(
            **image_file_data_formatted(i)
          )
        end
      end

      private

      def image_file_data_formatted(image_file)
        Muffon::Utils::ImageFile.call(
          image: image_file
        )
      end
    end
  end
end
