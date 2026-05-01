module YandexMusic
  module Artist
    class Albums < YandexMusic::Artist::Base
      private

      def artist_data
        {
          **super,
          **albums_data
        }
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def raw_collection
        raw_artist_data['albums']
      end

      def request_params
        {
          **super,
          sort: 'year',
          what: 'albums'
        }
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        YandexMusic::Artist::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
