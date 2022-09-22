module Muffon
  module Utils
    module ImageProcessing
      def process_image(image_file)
        return if image_file.blank?

        image.purge_later if image.attached?

        return if image_file == 'DELETED'

        image.attach(
          **image_file_data_formatted(
            image_file
          )
        )
      rescue OpenURI::HTTPError
        nil
      end

      def process_images(image_files)
        images.purge_later if images.attached?

        image_files&.each do |i|
          images.attach(
            **image_file_data_formatted(i)
          )
        end
      rescue OpenURI::HTTPError
        nil
      end

      def process_background_image(image_file)
        return if image_file.blank?

        background_images.attach(
          **image_file_data_formatted(
            image_file
          )
        )

        background_images.last
      rescue OpenURI::HTTPError
        nil
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
