module AmazonMusic
  module Search
    class Tracks < AmazonMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def link
        "#{BASE_LINK}/searchCatalogTracks"
      end

      def collection_item_data_formatted(track)
        AmazonMusic::Search::Tracks::Track.call(
          track:,
          is_with_query_match: @args[:with_automatch],
          query_title: @args[:track_title],
          query_artist_name: @args[:artist_name],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
