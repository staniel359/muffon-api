module SoundCloud
  module Track
    class Base < SoundCloud::Base
      private

      def primary_args
        [@args.track_id]
      end

      def no_data?
        response_data.blank?
      end

      def link
        "#{base_link}/tracks/#{@args.track_id}"
      end

      def data
        { track: track_data }
      end
    end
  end
end
