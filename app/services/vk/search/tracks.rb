module VK
  module Search
    class Tracks < VK::Search::Base
      API_METHOD = 'audio.search'.freeze
      COLLECTION_NAME = 'tracks'.freeze

      private

      def collection_item_data_formatted(track)
        VK::Search::Tracks::Track.call(
          track: track,
          profile_id: @args.profile_id
        )
      end
    end
  end
end
