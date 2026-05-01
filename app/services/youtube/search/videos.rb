module YouTube
  module Search
    class Videos < YouTube::Search::Base
      private

      def request_params
        {
          **super,
          type: SCOPES_TYPES_DATA['videos']
        }
      end

      def search_data
        paginated_data(
          collection_name: 'videos',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          previous_page:,
          next_page:
        )
      end

      def raw_collection
        super.reject do |collection_item|
          channel_item?(
            collection_item
          )
        end
      end

      def collection_item_data_formatted(
        raw_video_data
      )
        YouTube::Search::Videos::Video.call(
          raw_video_data:,
          **self_args
        )
      end
    end
  end
end
