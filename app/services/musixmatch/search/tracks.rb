module MusixMatch
  module Search
    class Tracks < MusixMatch::Search::Base
      MODEL_NAME = 'track'.freeze
      COLLECTION_NAME = 'tracks'.freeze

      private

      def search_params
        super.merge(
          tracks_params
        )
      end

      def tracks_params
        { s_track_rating: 'desc' }
      end

      def collection_item_data_formatted(track)
        MusixMatch::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
