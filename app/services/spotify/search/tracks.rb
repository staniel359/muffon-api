module Spotify
  module Search
    class Tracks < Spotify::Search::Base
      COLLECTION_TYPE = 'track'.freeze
      TOTAL_LIMIT = 500

      private

      def collection_item_data_formatted(track)
        Spotify::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
