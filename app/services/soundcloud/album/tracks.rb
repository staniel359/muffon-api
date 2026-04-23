module SoundCloud
  module Album
    class Tracks < SoundCloud::Album::Base
      include SoundCloud::Mixins::Album

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_album_data
          album_data
        ]
      end

      def album_data
        { tracks: }
      end

      def raw_tracks
        if raw_album_data['tracks'].present?
          response_data
        else
          []
        end
      end

      def raw_album_data
        @args[:raw_album_data]
      end

      def link
        "#{BASE_LINK}/tracks"
      end

      def params
        {
          **super,
          ids: tracks_ids_string
        }
      end

      def tracks_ids_string
        raw_album_data['tracks']
          .pluck('id')
          .join(',')
      end

      def track_data_formatted(
        raw_track_data
      )
        SoundCloud::Album::Tracks::Track.call(
          raw_track_data:,
          album_data: @args[:album_data],
          **self_args
        )
      end
    end
  end
end
