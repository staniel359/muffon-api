module YouTubeMusic
  module Search
    class Tracks < YouTubeMusic::Search::Base
      COLLECTION_NAME = 'tracks'.freeze
      SCOPE = 'tracks'.freeze

      private

      def collection_item_data_formatted(
        raw_track_data
      )
        YouTubeMusic::Search::Tracks::Track.call(
          raw_track_data:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
