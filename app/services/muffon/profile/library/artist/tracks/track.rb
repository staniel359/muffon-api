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
              {
                id: profile_track.id,
                favorite_id:,
                player_id: track.player_id,
                title: track.title,
                album: album_data,
                image: profile_album&.image_data,
                created: created_formatted
              }.compact
            end

            def profile_track
              @args[:profile_track]
            end
          end
        end
      end
    end
  end
end
