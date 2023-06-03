module LastFM
  module Top
    class Tracks < LastFM::Top::Base
      COLLECTION_NAME = 'tracks'.freeze
      MODEL_NAME = 'track'.freeze

      private

      def collection_item_data_formatted(track)
        LastFM::Top::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
