module Odnoklassniki
  module Track
    class Base < Odnoklassniki::Base
      ENDPOINT_NAME = 'play'.freeze
      include Odnoklassniki::Utils::Track

      private

      def primary_args
        [@args[:track_id]]
      end

      def params
        super.merge(
          track_params
        )
      end

      def track_params
        { tid: @args[:track_id] }
      end

      def data
        { track: track_data }
      end

      def track
        @track ||=
          response_data['track']
      end

      def artists
        [artist_data_formatted]
      end

      def artist_data_formatted
        {
          name: artist_name,
          odnoklassniki_id: artist_odnoklassniki_id
        }
      end

      def artist_name
        track['ensemble']
      end

      def artist_odnoklassniki_id
        track['masterArtistId']
      end
    end
  end
end
