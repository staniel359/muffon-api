module LastFM
  module Utils
    module Album
      private

      def title
        album['name']
      end

      def artist_data_formatted
        { name: artist_name }
      end

      def artist_name
        album['artist']
      end

      def image_data
        image_data_formatted(image, 'album')
      end

      def image
        album.dig('image', -1, '#text')
      end

      def listeners_count
        ::Album.with_artist_title(
          artist_name, title
        ).listeners_count
      end
    end
  end
end
