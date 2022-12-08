module Muffon
  module Utils
    module ImageProcessing
      def process_image(image_file)
        return if image_file.blank?

        image.purge_later if image.attached?

        return if image_file == 'DELETED'

        attach_image(
          image_file
        )
      end

      def process_images(image_files)
        images.purge_later if images.attached?

        attach_images(
          image_files
        )
      end

      private

      def attach_image(image_file)
        image.attach(
          **image_file_data(
            image_file
          )
        )
      rescue OpenURI::HTTPError
        nil
      end

      def image_file_data(image_file)
        Muffon::Utils::ImageFile.call(
          image: image_file
        )
      end

      def attach_images(image_files)
        image_files&.each do |image_file|
          images.attach(
            **image_file_data(
              image_file
            )
          )
        end
      rescue OpenURI::HTTPError
        nil
      end
    end
  end
end
