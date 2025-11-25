module YouTube
  module Search
    class Channels < YouTube::Search::Base
      private

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

      def params
        {
          **super,
          type: 'channel'
        }
      end

      def collection_item_data_formatted(channel)
        YouTube::Search::Channels::Channel.call(
          channel:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
