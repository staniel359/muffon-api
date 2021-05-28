module Odnoklassniki
  module Search
    class Tracks < Odnoklassniki::Search::Base
      COLLECTION_NAME = 'tracks'.freeze
      ENDPOINT_NAME = 'tracks'.freeze

      private

      def collection_item_data_formatted(track)
        Odnoklassniki::Search::Tracks::Track.call(
          track: track
        )
      end
    end
  end
end
