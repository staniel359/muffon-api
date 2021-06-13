module LastFM
  module Track
    class Similar < LastFM::Track::Base
      API_METHOD = 'track.getSimilar'.freeze
      COLLECTION_NAME = 'similar'.freeze
      include LastFM::Track::Utils::Pagination

      private

      def no_data?
        super || raw_collection_list.blank?
      end

      def raw_collection_list
        @raw_collection_list ||= track['track']
      end

      def track
        @track ||= response_data['similartracks']
      end

      def collection_item_data_formatted(track)
        LastFM::Track::Similar::Track.call(
          track: track
        )
      end
    end
  end
end
