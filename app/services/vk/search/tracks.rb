module VK
  module Search
    class Tracks < VK::Search::Base
      API_METHOD = 'audio.search'.freeze
      COLLECTION_NAME = 'tracks'.freeze
      TOTAL_LIMIT = 500

      private

      def collection_item_data_formatted(track)
        VK::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
