module AmazonMusic
  module Track
    class Base < AmazonMusic::Album::Base
      include AmazonMusic::Utils::Track

      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        super + %i[
          track_id
        ]
      end

      def not_found?
        super ||
          track.blank?
      end

      def track
        @track ||=
          tracks_list.find do |t|
            matched_track?(t)
          end
      end

      def matched_track?(track_data)
        track_data.dig(
          'primaryLink', 'deeplink'
        ).include?(track_id)
      end

      def track_id
        @args[:track_id]
      end

      def data
        { track: track_data }
      end
    end
  end
end
