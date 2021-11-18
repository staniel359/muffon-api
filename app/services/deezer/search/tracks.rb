module Deezer
  module Search
    class Tracks < Deezer::Search::Base
      COLLECTION_NAME = 'tracks'.freeze
      MODEL_NAME = 'track'.freeze

      private

      def collection_item_data_formatted(track)
        Deezer::Search::Tracks::Track.call(
          track: track,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
