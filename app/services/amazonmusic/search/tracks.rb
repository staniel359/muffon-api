module AmazonMusic
  module Search
    class Tracks < AmazonMusic::Search::Base
      COLLECTION_NAME = 'tracks'.freeze

      private

      def link
        "#{BASE_LINK}/searchCatalogTracks"
      end

      def collection_item_data_formatted(track)
        AmazonMusic::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
