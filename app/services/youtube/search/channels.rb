module YouTube
  module Search
    class Channels < YouTube::Search::Base
      private

      def params
        {
          **super,
          type: SCOPES_TYPES_DATA['channels']
        }
      end

      def search_data
        paginated_data(
          collection_name: 'channels',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          previous_page:,
          next_page:
        )
      end

      def collection_item_data_formatted(
        raw_video_channel_data
      )
        YouTube::Search::Channels::Channel.call(
          raw_video_channel_data:,
          **self_args
        )
      end
    end
  end
end
