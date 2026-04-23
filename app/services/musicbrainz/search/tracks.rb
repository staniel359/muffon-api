module MusicBrainz
  module Search
    class Tracks < MusicBrainz::Search::Base
      MODEL_NAME = 'recording'.freeze

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

      def raw_collection
        response_data['recordings']
      end

      def link
        "#{BASE_LINK}/recording"
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        MusicBrainz::Search::Tracks::Track.call(
          raw_track_data:,
          **self_args
        )
      end
    end
  end
end
