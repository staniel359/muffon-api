module LastFM
  module Artist
    class Tracks < LastFM::Artist::Base
      API_METHOD = 'artist.getTopTracks'.freeze
      COLLECTION_NAME = 'tracks'.freeze
      TOTAL_LIMIT = 500
      include LastFM::Artist::Utils::Pagination

      private

      def artist
        response_data['toptracks']
      end

      def collection_list
        artist['track'].last(limit)
      end

      def collection_item_data_formatted(track)
        LastFM::Artist::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
