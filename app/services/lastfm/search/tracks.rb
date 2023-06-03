module LastFM
  module Search
    class Tracks < LastFM::Search::Base
      COLLECTION_NAME = 'tracks'.freeze
      MODEL_NAME = 'track'.freeze

      private

      def collection_item_data_formatted(track)
        LastFM::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
