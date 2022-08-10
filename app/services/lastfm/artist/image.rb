module LastFM
  module Artist
    class Image < LastFM::Artist::Base
      include Muffon::Utils::Artist

      private

      def artist_data
        update_image if update_image?

        { image: image_data }
      end

      def update_image?
        no_image? &&
          images_list.present?
      end

      def no_image?
        find_artist
          .image_url
          .blank?
      end

      def images_list
        @images_list ||=
          artist_images_data&.dig(
            :artist, :images
          )
      end

      def artist_images_data
        LastFM::Artist::Images.call(
          artist: @args[:artist]
        )
      end

      def update_image
        find_artist.update(
          image_url:
        )
      end

      def image_url
        images_list.dig(
          0, :medium
        )
      end
    end
  end
end
