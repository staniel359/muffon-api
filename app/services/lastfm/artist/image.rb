module LastFM
  module Artist
    class Image < LastFM::Artist::Base
      include Muffon::Utils::Artist

      private

      def artist_data
        update_image

        { image: image_data }
      end

      def update_image
        find_artist.update!(
          image_url:
        )
      end

      def image_url
        image || 'MISSING'
      end

      def image
        images_list.dig(
          0, :medium
        )
      end

      def images_list
        artist_images_data&.dig(
          :artist, :images
        ) || []
      end

      def artist_images_data
        LastFM::Artist::Images.call(
          artist_name:
            @args[:artist_name]
        )
      end
    end
  end
end
