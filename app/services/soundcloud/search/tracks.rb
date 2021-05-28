module SoundCloud
  module Search
    class Tracks < SoundCloud::Search::Base
      COLLECTION_NAME = 'tracks'.freeze

      private

      def collection_item_data_formatted(track)
        SoundCloud::Search::Tracks::Track.call(
          track: track
        )
      end
    end
  end
end
