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

      def name
        artist_info_data.dig(
          :artist,
          :name
        )
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        response_data['albums']
      end

      def request_url
        "#{super}/direct-albums"
      end

      def request_params
        {
          **super,
          'sort-by' => 'year',
          'page' => page - 1,
          'pageSize' => limit
        }
      end

      def items_count
        response_data.dig(
          'pager',
          'total'
        )
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
