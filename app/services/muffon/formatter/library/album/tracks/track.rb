module Muffon
  module Formatter
    module Library
      module Album
        class Tracks
          class Track < Muffon::Formatter::Library::Track::Base
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                library_track_record
              ]
            end

            def data
              {
                **self_data,
                source: source_data,
                library: library_track_data,
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
end
