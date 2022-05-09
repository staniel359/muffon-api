module Genius
  module Track
    class Base < Genius::Base
      include Genius::Utils::Track

      private

      def primary_args
        [@args[:track_id]]
      end

      def no_data?
        track.blank?
      end

      def track
        response_data.dig(
          'response', 'song'
        )
      end

      def link
        "#{BASE_LINK}/songs/#{@args[:track_id]}"
      end

      def data
        { track: track_data }
      end

      def artists_list
        track.values_at(
          'primary_artist',
          'featured_artists'
        ).flatten.compact
      end
    end
  end
end
