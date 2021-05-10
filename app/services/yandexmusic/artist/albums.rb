module YandexMusic
  module Artist
    class Albums < YandexMusic::Base
      include YandexMusic::Paginated

      private

      def primary_args
        [@args.artist_id]
      end

      def no_data?
        response_data['albums'].blank?
      end

      def link
        'https://music.yandex.ru/handlers/artist.jsx'
      end

      def params
        {
          artist: @args.artist_id,
          what: 'albums',
          sort: 'year',
          lang: 'en'
        }
      end

      def data
        { artist: artist_data.merge(paginated_data) }
      end

      def artist_data
        { name: response_data.dig('artist', 'name') }
      end

      def collection_name
        'albums'
      end

      def albums_data
        paginated_collection.map { |a| album_data(a) }
      end

      def collection_list
        response_data['albums']
      end

      def album_data(album)
        {
          title: full_title(album),
          image: image_data(album, 'album'),
          released: album['year'].to_s,
          yandex_music_id: album['id']
        }
      end
    end
  end
end
