module LastFM
  module Top
    class Tracks < LastFM::Top::Base
      API_METHOD = 'chart.getTopTracks'.freeze
      COLLECTION_NAME = 'tracks'.freeze
      MODEL_NAME = 'track'.freeze

      private

      def collection_list
        super.last(limit)
      end

      def collection_item_data_formatted(track)
        LastFM::Top::Tracks::Track.call(
          track: track,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
