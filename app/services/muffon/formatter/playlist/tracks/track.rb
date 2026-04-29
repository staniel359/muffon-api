module Muffon
  module Formatter
    module Playlist
      module Tracks
        class Track < Muffon::Formatter::Playlist::Track::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              playlist_track_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              id:,
              player_id: player_source_id,
              title:,
              artist: artist_data,
              artists:,
              album: album_data,
              image: image_data,
              created: creation_date,
              audio: audio_data
            }.compact
          end
        end
      end
    end
  end
end
