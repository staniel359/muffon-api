module YandexMusic
  module Search
    class Albums < YandexMusic::Search::Base
      private

      def collection_name
        'albums'
      end

      def collection_item_data(album)
        {
          title: album['title'],
          artist: artist_data(album),
          image: image_data(album, 'album'),
          released: album['originalReleaseYear'].to_s,
          yandex_music_id: album['id']
        }
      end

      def artist_data(album)
        { name: artist_name(album) }
      end
    end
  end
end
