module LastFM
  module Track
    class Similar < LastFM::Track::Base
      API_METHOD = 'track.getSimilar'.freeze
      COLLECTION_NAME = 'similar'.freeze
      TOTAL_LIMIT = 200

      include LastFM::Track::Utils::Pagination

      private

      def track_info_data
        return {} if @args[:minimal]

        super
      end

      def track
        response_data[
          'similartracks'
        ]
      end

      def pagination_params
        { limit: TOTAL_LIMIT }
      end

      def raw_collection_list
        track['track']
      end

      def collection_item_data_formatted(track)
        LastFM::Track::Similar::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token],
          minimal: @args[:minimal]
        )
      end
    end
  end
end
