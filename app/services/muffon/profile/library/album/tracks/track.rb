module Muffon
  module Profile
    module Library
      module Album
        class Tracks
          class Track < Muffon::Profile::Library::Album::Tracks
            include Muffon::Utils::Library::Track

            def call
              data
            end

            private

            def data
              self_data
                .merge(track_data)
            end

            def track_data
              {
                source: source_data,
                library: library_track_data,
                player_id: track.player_id,
                title:,
                album: album_data,
                image: image_data,
                created: created_formatted,
                audio: audio_data
              }
            end

            def library_track
              @args[:library_track]
            end
          end
        end
      end
    end
  end
end
