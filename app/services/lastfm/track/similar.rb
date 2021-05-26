module LastFM
  module Track
    class Similar < LastFM::Track::Base
      API_METHOD = 'track.getSimilar'.freeze
      COLLECTION_NAME = 'similar'.freeze
      include LastFM::Utils::Pagination

      private

      def no_data?
        super || tracks_list.blank?
      end

      def tracks_list
        @tracks_list ||= track['track']
      end

      def track
        @track ||= response_data['similartracks']
      end

      def params
        super.merge(pagination_params)
      end

      def total_items_count
        tracks_list.size
      end

      def collection_list
        collection_paginated(tracks_list)
      end

      def collection_item_data_formatted(track)
        LastFM::Track::Similar::Track.call(
          track: track
        )
      end

      alias track_data paginated_data
    end
  end
end
