module Muffon
  module Profile
    module Library
      module Compatibility
        class Tracks
          class Track < Muffon::Profile::Library::Compatibility::Tracks
            include Muffon::Utils::Library::Track

            def call
              data
            end

            private

            def data
              {
                id: profile_track.id,
                title: track.title,
                artist: artist_data,
                image: profile_album&.image_data
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
