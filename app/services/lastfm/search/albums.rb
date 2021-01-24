module LastFM
  module Search
    class Albums < LastFM::Search::Base
      private

      def model_name
        'album'
      end

      def collection_name
        'albums'
      end

      def collection_item_data(album)
        {
          title: album['name'],
          artist: album_artist_data(album),
          images: images_data(album, 'album')
        }
      end

      def album_artist_data(album)
        { name: album['artist'] }
      end
    end
  end
end
