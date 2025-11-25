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
        artist['albums']
      end

      def params
        {
          **super,
          sort: 'year',
          what: 'albums'
        }
      end

      def collection_item_data_formatted(album)
        YandexMusic::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
