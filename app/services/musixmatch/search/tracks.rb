module MusixMatch
  module Search
    class Tracks < MusixMatch::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        response_data.dig(
          'message',
          'body',
          'track_list'
        )
      end

      def link
        "#{BASE_LINK}/track.search"
      end

      def collection_item_data_formatted(track)
        MusixMatch::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
