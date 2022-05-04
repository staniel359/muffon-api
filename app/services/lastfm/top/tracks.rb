module LastFM
  module Top
    class Tracks < LastFM::Top::Base
      COLLECTION_NAME = 'tracks'.freeze
      MODEL_NAME = 'track'.freeze
      TOTAL_LIMIT = 2_500

      private

      def collection_item_data_formatted(track)
        LastFM::Top::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
