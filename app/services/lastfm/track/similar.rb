module LastFM
  module Track
    class Similar < LastFM::Track::Base
      API_METHOD = 'track.getSimilar'.freeze
      COLLECTION_NAME = 'similar'.freeze
      include LastFM::Track::Utils::Pagination

      private

      def raw_collection_list
        @raw_collection_list ||= track['track']
      end

      def track
        @track ||=
          response_data['similartracks']
      end

      def collection_item_data_formatted(track)
        LastFM::Track::Similar::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
