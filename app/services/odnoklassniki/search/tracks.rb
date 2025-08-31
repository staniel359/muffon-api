module Odnoklassniki
  module Search
    class Tracks < Odnoklassniki::Search::Base
      COLLECTION_NAME = 'tracks'.freeze
      ENDPOINT_NAME = 'tracks'.freeze

      private

      def collection_item_data_formatted(track)
        Odnoklassniki::Search::Tracks::Track.call(
          track:,
          albums:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
