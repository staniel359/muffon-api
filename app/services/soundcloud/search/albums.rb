module SoundCloud
  module Search
    class Albums < SoundCloud::Search::Base
      private

      def collection_name
        'albums'
      end

      def collection_item_data(album)
        {
          title: album['title'],
          artist: artist_data(album),
          images: images_data(album, 'album'),
          soundcloud_id: album['id']
        }
      end
    end
  end
end
