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

      def collection_item_data_formatted(track)
        MusicBrainz::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
