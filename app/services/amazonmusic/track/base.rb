module AmazonMusic
  module Track
    class Base < AmazonMusic::Album::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        [
          *super,
          :track_id
        ]
      end

      def not_found?
        super || raw_track_data.blank?
      end

      def raw_track_data
        @raw_track_data ||=
          raw_tracks.find do |raw_track_data|
            matched_track?(
              raw_track_data
            )
          end
      end

      def matched_track?(
        raw_track_data
      )
        raw_track_data
          .dig(
            'primaryLink',
            'deeplink'
          )
          .include?(
            @args[:track_id]
          )
      end

      def data
        { track: track_data }
      end
    end
  end
end
