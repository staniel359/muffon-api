module Genius
  module Album
    class Tracks < Genius::Album::Base
      include Muffon::Mixins::Formatting::Collection

      private

      def album_data
        { tracks: }
      end

      def raw_tracks
        response_data.dig(
          'response',
          'tracks'
        )
      end

      def link
        "#{super}/tracks"
      end

      def track_data_formatted(
        raw_track_data
      )
        Genius::Album::Tracks::Track.call(
          raw_track_data:,
          album_data: @args[:album_data],
          **self_args
        )
      end
    end
  end
end
