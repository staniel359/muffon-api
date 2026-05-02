module LastFM
  module Artist
    class Image < LastFM::Artist::Info
      private

      def artist_data
        update_artist_record!

        { image: image_data }
      end

      def image_url
        images_list.dig(
          0,
          :medium
        ) || 'MISSING'
      end

      def images_list
        artist_images_data.dig(
          :artist,
          :images
        )
      end

      def artist_images_data
        LastFM::Artist::Images.call(
          artist_name: @args[:artist_name]
        )
      end
    end
  end
end
