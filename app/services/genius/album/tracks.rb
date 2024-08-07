module Genius
  module Album
    class Tracks < Genius::Album::Base
      private

      def no_data?
        false
      end

      def tracks_list
        response_data.dig(
          'response', 'tracks'
        )
      end

      def link
        "#{super}/tracks"
      end

      def data
        { tracks: }
      end

      def track_data_formatted(track)
        Genius::Album::Tracks::Track.call(
          track: track['song'],
          album_data: @args[:album_data],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
