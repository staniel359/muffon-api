module MusicBrainz
  module Search
    class Tracks < MusicBrainz::Search::Base
      COLLECTION_NAME = 'tracks'.freeze
      MODEL_NAME = 'recording'.freeze
      TOTAL_LIMIT = 500

      private

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
