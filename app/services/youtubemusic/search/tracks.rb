module YouTubeMusic
  module Search
    class Tracks < YouTubeMusic::Search::Base
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

      def scope_params
        YouTubeMusic::Search::ScopeParams.call(
          query: @args[:query],
          scope: 'tracks'
        )
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        YouTubeMusic::Search::Tracks::Track.call(
          raw_track_data:,
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
