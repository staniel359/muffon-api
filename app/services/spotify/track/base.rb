module Spotify
  module Track
    class Base < Spotify::Base
      include Spotify::Utils::Track

      private

      def primary_args
        [@args[:track_id]]
      end

      def no_data?
        track.blank?
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
