module Genius
  module Search
    class Tracks < Genius::Search::Base
      COLLECTION_NAME = 'tracks'.freeze
      MODEL_NAME = 'song'.freeze

      private

      def collection_item_data_formatted(track)
        Genius::Search::Tracks::Track.call(
          track: track['result'],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
