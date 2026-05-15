module YandexMusic
  module Search
    class Albums < YandexMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def request_params
        {
          **super,
          type: 'album',
          filter: 'album'
        }
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        YandexMusic::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
