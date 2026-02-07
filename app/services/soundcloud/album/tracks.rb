module SoundCloud
  module Album
    class Tracks < SoundCloud::Album::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_album_data
          album_base_data
        ]
      end

      def data
        { tracks: }
      end

      def raw_tracks
        if raw_album_tracks.present?
          response_data
        else
          []
        end
      end

      def raw_album_tracks
        @args[:raw_album_data]['tracks']
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
        raw_album_tracks
          .pluck('id')
          .join(',')
      end

      def track_data_formatted(track)
        SoundCloud::Album::Tracks::Track.call(
          track:,
          album_data: @args[:album_base_data],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
