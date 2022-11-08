module Muffon
  module Profile
    module Library
      module Artist
        class Tracks
          class Track < Muffon::Profile::Library::Artist::Tracks
            include Muffon::Utils::Library::Track

            def call
              data
            end

            private

            def data
              self_data
                .merge(track_base_data)
                .merge(track_extra_data)
            end

            def track_base_data
              {
                source: source_data,
                library: library_track_data,
                player_id: track.player_id,
                title:
              }.compact
            end

            def library_track
              @args[:library_track]
            end

            def track_extra_data
              {
                album: album_data,
                image: image_data,
                created: created_formatted,
                audio: audio_data
              }.compact
            end
          end
        end
      end
    end
  end
end
