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

      def collection_item_data_formatted(
        raw_track_data
      )
        SoundCloud::Search::Tracks::Track.call(
          raw_track_data:,
          is_with_query_match: @args[:with_automatch],
          query_title: @args[:track_title],
          query_artist_name: @args[:artist_name],
          **self_args
        )
      end
    end
  end
end
