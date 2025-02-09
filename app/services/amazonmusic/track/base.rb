module AmazonMusic
  module Track
    class Base < AmazonMusic::Album::Base
      include AmazonMusic::Utils::Track

      private

      def primary_args
        super + [
          @args[:track_id]
        ]
      end

      def no_data?
        super || track.blank?
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
