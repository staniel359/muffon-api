module SoundCloud
  module Search
    class Tracks < SoundCloud::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def link
        "#{BASE_LINK}/search/tracks"
      end

      def collection_item_data_formatted(track)
        SoundCloud::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
