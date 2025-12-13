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
          maximum_items_count:
        )
      end

      def link
        "#{BASE_LINK}/search/tracks"
      end

      def collection_item_data_formatted(track)
        SoundCloud::Search::Tracks::Track.call(
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
