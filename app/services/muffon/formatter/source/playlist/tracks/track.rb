module Muffon
  module Formatter
    module Source
      module Playlist
        module Tracks
          class Track < Muffon::Formatter::Source::Track::Base
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                source_original_link
                source_name
                source_track_id
                title
                artists
                album_title
                source_album_id
                image_data
                duration
                creation_date
                is_audio_present
              ]
            end

            def data
              {
                source: source_data,
                player_id: player_source_id,
                title:,
                artist: artist_data,
                artists:,
                album: album_data,
                image: image_data,
                duration:,
                created: creation_date,
                audio: audio_data
              }.compact
            end
          end
        end
      end
    end
  end
end
