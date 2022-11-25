module Bandcamp
  module Search
    class Tracks < Bandcamp::Search::Base
      MODEL_NAME = 'track'.freeze
      COLLECTION_NAME = 'tracks'.freeze

      private

      def collection_item_data_formatted(track)
        Bandcamp::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
