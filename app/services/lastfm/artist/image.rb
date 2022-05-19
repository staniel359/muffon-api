module LastFM
  module Artist
    class Image < LastFM::Artist::Base
      include Muffon::Utils::Artist

      private

      def artist_data
        if image_present?
          { image: image_data }
        else
          update_image

          { image: first_image_data }
        end
      end

      def image_present?
        find_artist
          .image
          .attached?
      end

      def update_image
        return if first_image_data.blank?

        ::Artist::Image::UpdaterWorker.perform_async(
          artist_image_worker_args
        )
      end

      def first_image_data
        @first_image_data ||= images_list[0]
      end

      def artist_image_worker_args
        {
          name: find_artist.name,
          image: first_image_data[:large]
        }.to_json
      end

      def images_list
        artist_images_data.dig(
          :artist, :images
        ) || []
      end

      def artist_images_data
        LastFM::Artist::Images.call(
          artist: @args[:artist]
        )
      end
    end
  end
end
