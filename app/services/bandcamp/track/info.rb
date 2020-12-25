module Bandcamp
  module Track
    class Info < Bandcamp::Base
      private

      def primary_args
        [@args.track_link]
      end

      def no_data?
        track_script.blank?
      end

      def track_script
        @track_script ||= response_data.css('script')[3]
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          title: track_info_data['title'],
          artist: tracks_info_data['artist'],
          length: track_info_data['duration'].floor,
          audio_link: track_info_data.dig('file', 'mp3-128')
        }
      end

      def track_info_data
        @track_info_data ||= tracks_info_data.dig('trackinfo', 0)
      end

      def tracks_info_data
        JSON.parse(track_script['data-tralbum'])
      end
    end
  end
end
