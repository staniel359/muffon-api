module LastFM
  module Artist
    class Tracks < LastFM::Artist::Base
      API_METHOD = 'artist.getTopTracks'.freeze
      COLLECTION_NAME = 'tracks'.freeze
      TOTAL_LIMIT = 750
      LIMIT = 500
      include LastFM::Utils::Pagination

      private

      def no_data?
        super || tracks_list.blank?
      end

      def artist
        @artist ||= response_data['toptracks']
      end

      def total_limit
        TOTAL_LIMIT
      end

      def tracks_list
        @tracks_list ||= artist['track']
      end

      def total_items_count
        [tracks_list.size, LIMIT].min
      end

      def collection_list
        collection_paginated(tracks_list)
      end

      def collection_item_data_formatted(track)
        LastFM::Artist::Tracks::Track.call(
          track: track
        )
      end

      alias artist_data paginated_data
    end
  end
end
