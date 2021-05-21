module Bandcamp
  module Search
    class Tracks < Bandcamp::Search::Base
      COLLECTION_NAME = 'tracks'.freeze

      private

      def collection_item_data_formatted(track)
        Bandcamp::Search::Tracks::Track.call(
          track: track
        )
      end
    end
  end
end
