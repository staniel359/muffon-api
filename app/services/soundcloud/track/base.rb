module SoundCloud
  module Track
    class Base < SoundCloud::API::V2::Base
      include SoundCloud::Utils::Track

      private

      def primary_args
        [@args[:track_id]]
      end

      def no_data?
        track.blank?
      rescue Faraday::ServerError
        true
      end

      def link
        "#{BASE_LINK}/tracks/#{@args[:track_id]}"
      end

      def data
        { track: track_data }
      end

      alias track response_data
    end
  end
end
